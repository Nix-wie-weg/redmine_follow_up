module FollowUp
  def self.process
    query.each do |value|
      issue = value.customized
      issue.init_journal(user, message)
      value.value = nil
      value.save
      issue.priority = priority
      issue.assigned_to = last_user_for(issue)
      issue.save
    end
  end

  def self.query
    sql = [
      'custom_field_id = ?',
      'customized_type = ?',
      'DATE(value) < CURDATE()'
    ].join(' AND ')
    CustomValue.all(:conditions => [sql, settings['custom_field'], 'Issue'])
  end

  def self.settings
    ::Setting[:plugin_follow_up]
  end

  def self.user
    ::User.find(settings['user'])
  end

  def self.priority
    ::IssuePriority.find(settings['priority'])
  end

  def self.message
    settings['message'].to_s
  end

  def self.last_user_for(issue)
    assigned_id = issue.journals.collect do |j|
      j.changes['assigned_to_id']
    end.flatten.compact.last
    User.find(assigned_id || issue.author_id)
  end
end
