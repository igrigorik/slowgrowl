# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "slowgrowl"
  s.version = "0.1.3"

  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ilya Grigorik", "Milan Dobrota"]
  s.email       = ["ilya@igvita.com"]
  s.homepage    = "http://github.com/igrigorik/slowgrowl"
  s.summary     = "Surface slow code paths in your Rails 3 app via Growl / libnotify"
  s.description = s.summary
  s.rubyforge_project = "slowgrowl"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end