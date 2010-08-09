module SlowGrowl
  if RUBY_PLATFORM =~ /linux/i
    NOTIFIER = :libnotify
    GEMS = [{:name => 'gtk2'}, {:name => 'ruby-libnotify', :require => 'rnotify'}]
  else
    NOTIFIER = :growl
    GEMS = [{:name => 'growl'}]
  end
end
