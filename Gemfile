require 'lib/platform'

source :gemcutter

SlowGrowl::GEMS.each do |dep|
  gem dep[:name], :require => (dep[:require] || dep[:name])
end
