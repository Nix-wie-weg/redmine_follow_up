# Redmine FollowUp

FollowUp for Redmine bumps a tickets priority after certain
datecondition is met. It allows for configuration of bumped status and
journal message.

## Installation

<pre>
script/plugin install git://github.com/Nix-wie-weg/redmine_follow_up.git
</pre>

Add this line to your crontab:
<pre>
0  6 * * *      cd /var/www/your_redmine_host/current && RAILS_ENV=production bundle exec rake follow_up:process
</pre>

## Configuration

You can fully configure the plugin in the Redmine plugins pane.

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Send us a pull request. Bonus points for topic branches.

## Credits

* [der-flo](https://github.com/der-flo), [svenwin](https://github.com/svenwin) former core committer

## Copyright

Copyright © Nix-wie-weg® GmbH & Co. KG. See LICENSE for details.
