require File.dirname(__FILE__) + '/config.rb'

DEPENDENT_GEMS.each do |gem_name|
  require gem_name
end

module SlowGrowl
  class Railtie < Rails::Railtie
    config.slowgrowl = ActiveSupport::OrderedOptions.new
    config.slowgrowl.warn = 1000    # default slow alert set to 1000ms
    config.slowgrowl.sticky = false # should error warnings be sticky?

    initializer "slowgrowl.initialize" do |app|

      ActiveSupport::Notifications.subscribe do |*args|
	if NOTIFIER #either growl or ruby-libnotify
          event = ActiveSupport::Notifications::Event.new(*args)

          sticky = false
          action, type = event.name.split('.')
          alert = case event.duration
            when (0...config.slowgrowl.warn) then
              false
            when (config.slowgrowl.warn..config.slowgrowl.warn*2) then
              :warning
            else
              sticky = config.slowgrowl.sticky
              :error
          end

          e = event.payload
          message = case type
            when 'action_controller' then
              case action
                when 'process_action' then
                  # {:controller=>"WidgetsController", :action=>"index", :params=>{"controller"=>"widgets", "action"=>"index"},
                  #  :formats=>[:html], :method=>"GET", :path=>"/widgets", :status=>200, :view_runtime=>52.25706100463867,
                  #  :db_runtime=>0}

                  if e[:exception]
                    "%s#%s.\n\n%s" % [
                      e[:controller], e[:action], e[:exception].join(', ')
                    ]
                  else
                    "%s#%s (%s).\nDB: %.1f, View: %.1f" % [
                      e[:controller], e[:action], e[:status], e[:db_runtime], e[:view_runtime]
                    ]
                  end

                else
                  '%s#%s (%s)' % [e[:controller], e[:action], e[:status]]
              end

            when 'action_view' then
              # {:identifier=>"text template", :layout=>nil }
              '%s, layout: %s' % [e[:identifier], e[:layout].nil? ? 'none' : e[:layout]]

            when 'active_record' then
              # {:sql=>"SELECT "widgets".* FROM "widgets", :name=>"Widget Load", :connection_id=>2159415800}
              "%s\n\n%s" % [e[:name], e[:sql].gsub("\n", ' ').squeeze(' ')]
            else
              'Duration: %.1f' % [event.duration]
          end

          if alert

	    title = "%1.fms - %s : %s" % [event.duration, action.humanize, type.camelize]

	    if NOTIFIER == 'growl'
	      Growl.send("notify_#{alert}", message, {
                         :title => title,
                         :sticky => sticky
	      })
	    elsif NOTIFIER == 'ruby-libnotify'
	      @notification.update(title, message, nil) if @notification
	      @notification = Notify::Notification.new(
			 "%1.fms - %s : %s" % [event.duration, action.humanize, type.camelize],
			 message,
			 nil,
			 nil
	      )
	      @notification.show
	    end
          end
        end
      end

    end
  end
end
