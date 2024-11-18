module ForemanSubnetsWithBgpConfig
  class Engine < ::Rails::Engine
    isolate_namespace ForemanSubnetsWithBgpConfig
    engine_name 'foreman_subnets_with_bgp_config'

    config.autoload_paths += Dir["#{config.root}/app"]

    initializer 'foreman_subnets_with_bgp_config.load_app_instance_data' do |app|
      ForemanSubnetsWithBgpConfig::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer 'foreman_subnets_with_bgp_config.register_plugin', :before => :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_subnets_with_bgp_config do
        requires_foreman '>= 3.3.0'

        parameter_filter ::Subnet, :as_local, :as_remote, :ip_remote
      end
    end

    config.to_prepare do
      ::Subnet.include ForemanSubnetsWithBgpConfig::SubnetExtensions if defined?(::Subnet)
      ::Subnet::Ipv4.include ForemanSubnetsWithBgpConfig::SubnetExtensions if defined?(::Subnet::Ipv4)
      ::Subnet::Ipv6.include ForemanSubnetsWithBgpConfig::SubnetExtensions if defined?(::Subnet::Ipv6)
    end

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        ForemanSubnetsWithBgpConfig::Engine.load_seed
      end
    end
  end
end
