SlowGrowl
=========

Rails 3 plugin which surfaces slow code paths in your Rails application by integrating with the new Notifications API in Rails 3 with your system Growl notification service. By default, any activity which takes longer than one second, will generate a growl alert, with the description of the action, time taken, and other meta data. A preview in action:

![slowgrowl notification](http://images.com)

Integrating with Rails 3
------------------------

    # in your Gemfile
    group :development do
        gem 'slowgrowl'
    end

That's it.

Configuring SlowGrowl
---------------------

    # in your config/environments/development.rb
    config.slowgrowl.warn = 1000    # growl any action which takes > 1000ms (1s)
    config.slowgrowl.sticky = true  # make really slow (2x warn) alerts sticky

Resources
---------

 * [Rails 3 Notifications API](http://edgeapi.rubyonrails.org/classes/ActiveSupport/Notifications.html)
 * [Railties](http://edgeapi.rubyonrails.org/classes/Rails/Railtie.html)