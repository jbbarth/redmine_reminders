Redmine Reminders plugin
=========================

This plugin adds the ability to define reminders for important stuff. The
reminders appear on /my/page, but I may add them everywhere later.

Screenshot
----------

![redmine_reminders screenshot](http://jbbarth.com/screenshots/redmine_reminders.png)

Install
-------

This plugin is compatible with Redmine 2.1.x and 2.2.x, and should be compatible with future versions.

You can first take a look at general instructions for plugins [here](http://www.redmine.org/wiki/redmine/Plugins).

Note that this plugin now depends on:
* **redmine_base_deface** which can be found [here](https://github.com/jbbarth/redmine_base_deface)

Then :
* clone this repository in your "plugins/" directory ; if you have a doubt you put it at the good level, you can check you have a plugins/redmine_reminders/init.rb file
* run the migrations from your redmine root directory with command : `RAILS_ENV=production rake redmine:plugins`
* install dependencies (gems) by running the following command: `bundle install`
* restart your Redmine instance (depends on how you host it)

Test status
------------

|Plugin branch| Redmine Version | Test Status       |
|-------------|-----------------|-------------------|
|master       | 6.0.5           | [![6.0.5][1]][5]  |
|master       | 5.1.8           | [![5.1.8][2]][5]  |
|master       | master          | [![master][4]][5] |

[1]: https://github.com/jbbarth/redmine_reminders/actions/workflows/6_0_5.yml/badge.svg
[2]: https://github.com/jbbarth/redmine_reminders/actions/workflows/5_1_8.yml/badge.svg
[4]: https://github.com/jbbarth/redmine_reminders/actions/workflows/master.yml/badge.svg
[5]: https://github.com/jbbarth/redmine_reminders/actions

Contribute
----------

If you like this plugin, it's a good idea to contribute :
* by giving feed back on what is cool, what should be improved
* by reporting bugs: you can open issues directly on github
* by forking it and sending pull request if you have a patch or a feature you want to implement
