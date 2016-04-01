module Tila
  module Modelable
    extend ActiveSupport::Concern

    included do
      helper_method :model, :resource_name, :resources_name, :model_name
    end

    class_methods do
      def model
        @model ||= controller_path.singularize.camelize.constantize
      end
    end

    protected

    def model
      self.class.model
    end

    def resource_name
      model.model_name.element
    end

    def resources_name
      resource_name.pluralize
    end

    def model_name
      model.model_name.singular
    end
  end
end
