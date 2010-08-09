require 'lib/platform'

source :rubygems
source :gemcutter

SlowGrowl::GEMS.each do |dep|
  gem dep[:name], :require => (dep[:require] || dep[:name])
end

# group :test do
#   gem 'rspec'
# end
