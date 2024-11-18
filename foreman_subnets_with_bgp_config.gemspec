require File.expand_path('lib/foreman_subnets_with_bgp_config/version', __dir__)

Gem::Specification.new do |s|
  s.name        = 'foreman_subnets_with_bgp_config'
  s.version     = ForemanSubnetsWithBgpConfig::VERSION
  s.metadata    = { 'is_foreman_plugin' => 'true' }
  s.license     = 'GPL-3.0'
  s.authors     = ['Xavier Mol']
  s.email       = ['xavier.mol@kit.edu']
  s.homepage    = 'https://git-cm.scc.kit.edu/foreman-plugins/foreman_subnets_with_bgp_config'
  s.summary     = 'Add additional settings to the subnet model about BGP configuration.'
  s.description = 'Add additional settings to the subnet model about BGP configuration.'

  s.files = Dir['{app,db,lib}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']

  s.required_ruby_version = '>= 2.7', '< 4'

  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-minitest'
  s.add_development_dependency 'rubocop-performance'
  s.add_development_dependency 'rubocop-rails'
end
