module Tila
  module ResourceLoaders
    extend ActiveSupport::Concern
    include Modelable
    include Objects

    protected

    def resource_base
      model
    end

    def load_resource
      if member_action?
        self.object ||= load_resource_instance
        instance_variable_set("@#{object_name}", object)
      else
        self.collection ||= load_collection
        instance_variable_set("@#{objects_name}", collection)
      end
    end

    def load_resource_instance
      if new_action?
        build_resource
      elsif params[:id]
        find_resource
      end
    end

    def find_resource
      resource_base.find(params[:id])
    end

    def build_resource
      resource_base.new
    end

    def load_collection
      resource_base.where(nil)
    end
  end
end