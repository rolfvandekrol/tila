module Tila
  module Storage
    extend ActiveSupport::Concern

    protected

    def resource_storage_base
      model
    end

    def persisted_resource_identifier
      params[:id]
    end

    def retrieve_resources
      resource_storage_base.where(nil)
    end

    def retrieve_persisted_resource
      resource_storage_base.find persisted_resource_identifier
    end

    def build_nonpersisted_resource
      resource_storage_base.new
    end

    def persist_resource(resource)
      resource.save
    end

    def unpersist_resource(resource)
      resource.destroy
    end

    def update_resource_attributes(resource, attributes)
      resource.attributes = attributes
    end
  end
end
