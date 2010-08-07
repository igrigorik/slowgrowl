if RUBY_PLATFORM =~ /linux/
  NOTIFIER = 'ruby-libnotify'
  DEPENDENT_GEMS = ['gtk2', 'rnotify']
else
  NOTIFIER = 'growl'
  DEPENDENT_GEMS = ['growl']
end
