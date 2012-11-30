module FollowUp
  def self.process
    v = CustomValue.find_all_by_custom_field_id_and_value_and_customized_type(
      settings["custom_field"], Date.today.to_s, "Issue")
    v.each do |value|
      issue = value.customized
      journal = issue.init_journal(user, message)
      value.value = nil
      value.save
      issue.priority = priority
      issue.assigned_to = last_user_for(issue)
      issue.save
    end
  end

  def self.settings
    ::Setting[:plugin_follow_up]
  end

  def self.user
    ::User.find(settings["user"])
  end

  def self.priority
    ::IssuePriority.find(settings["priority"])
  end

  def self.message
    settings["message"].to_s
  end

  def self.last_user_for(issue)
    assigned_id = issue.journals.collect do |j|
      j.changes["assigned_to_id"]
    end.flatten.compact.last
    User.find(assigned_id || issue.author_id)
  end

end
