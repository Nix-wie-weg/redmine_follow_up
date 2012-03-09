require 'redmine'

Redmine::Plugin.register :follow_up do
  name 'Follow-Up'
  author 'Nix-wie-weg'
  description 'Follow-Ups for Redmine/ChiliProject'
  version '0.0.1'
  settings :default => {'messsage' => '...'}, :partial => 'settings/settings'
end
