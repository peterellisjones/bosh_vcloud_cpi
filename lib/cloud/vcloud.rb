require 'forwardable'
require_relative 'vcloud/cloud'

module Bosh
  module Clouds

    class VCloud
      extend Forwardable

      def_delegators :@delegate,
                     :create_stemcell, :delete_stemcell,
                     :create_vm, :delete_vm, :reboot_vm, :has_vm?,
                     :configure_networks,
                     :create_disk, :delete_disk,
                     :attach_disk, :detach_disk,
                     :get_disk_size_mb,
                     :validate_deployment

      def initialize(options)
        @delegate = VCloudCloud::Cloud.new(options)
      end
    end

    Vcloud = VCloud # alias name for dynamic plugin loading
  end

end
