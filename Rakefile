require 'rake'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = 'slowgrowl'
    gemspec.summary = 'Surface slow code paths in your Rails 3 app via Growl'
    gemspec.description = gemspec.summary
    gemspec.email = 'ilya@igvita.com'
    gemspec.homepage = 'http://github.com/igrigorik/slowgrowl'
    gemspec.authors = ['Ilya Grigorik']
    gemspec.add_dependency('growl')
    gemspec.rubyforge_project = 'slowgrowl'
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler not available. Install it with: sudo gem install jeweler -s http://gemcutter.org'
end