module Tila
  module Modelable
    extend ActiveSupport::Concern

    class_methods do
      def model
        @model ||= controller_path.singularize.camelize.constantize
      end
    end

    protected

    def model
      self.class.model
    end

    def object_name
      self.class.model.model_name.element
    end
    def objects_name
      object_name.pluralize
    end

    def model_name
      model.model_name.singular
    end
  end
end