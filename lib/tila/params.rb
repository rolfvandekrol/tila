module Tila
  module Params
    extend ActiveSupport::Concern
    include Modelable
    include Objects

    protected

    def update_resource_params
      object.attributes = permitted_resource_params
    end

    def permitted_resource_params
      raise "The permitted_resource_params method should be overriden"
    end

    def resource_params
      params.require(object_name)
    end
  end
end