module Tila
  module Params
    extend ActiveSupport::Concern
    include Modelable

    included do
      helper_method :resource_params_name, :resource_params,
        :permitted_resource_params_list, :permitted_resource_params
    end

    protected

    def resource_params_name
      resource_name
    end

    def resource_params
      params.require(resource_params_name)
    end

    def permitted_resource_params_list
      raise NotImplementedError, "The permitted_resource_params_list method should be overriden"
    end

    def permitted_resource_params
      resource_params.permit(*permitted_resource_params_list)
    end
  end
end
