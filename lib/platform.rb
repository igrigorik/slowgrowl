module SlowGrowl
  if RUBY_PLATFORM =~ /linux/i
      NOTIFIER = :libnotify
      GEMS = ['gtk2', 'rnotify']
  else
    NOTIFIER = :growl
    GEMS = ['growl']
  end
end
