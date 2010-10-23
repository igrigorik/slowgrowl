require 'lib/platform'

Gem::Specification.new do |s|
  s.name = %q{slowgrowl}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ilya Grigorik", "Milan Dobrota"]
  s.date = %q{2010-08-14}
  s.description = %q{Surface slow code paths in your Rails 3 app via Growl / libnotify}
  s.email = %q{ilya@igvita.com}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".gitignore",
     "Gemfile",
     "README.md",
     "Rakefile",
     "VERSION",
     "lib/platform.rb",
     "lib/slowgrowl.rb",
     "slowgrowl.gemspec"
  ]
  s.homepage = %q{http://github.com/igrigorik/slowgrowl}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{slowgrowl}
  s.rubygems_version = %q{1.3.6}
  s.summary = s.description

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      SlowGrowl::GEMS.each { |dep| s.add_runtime_dependency(dep[:name], [">= 0"]) }
    else
      SlowGrowl::GEMS.each { |dep| s.add_dependency(dep[:name], [">= 0"]) }
    end
  else
    SlowGrowl::GEMS.each { |dep| s.add_dependency(dep[:name], [">= 0"]) }
  end
end