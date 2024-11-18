module ForemanSubnetsWithBgpConfig
  module SubnetExtensions
    extend ActiveSupport::Concern

    included do
      has_one :subnet_bgp_config,
        class_name: '::ForemanSubnetsWithBgpConfig::SubnetBgpConfig',
        inverse_of: :subnet,
        dependent: :destroy
      accepts_nested_attributes_for :subnet_bgp_config, reject_if: :all_blank
    end
  end
end
