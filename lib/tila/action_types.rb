module Tila
  module ActionTypes
    extend ActiveSupport::Concern

    included do
      helper_method :resources_action?,
                    :persisted_resource_action?, :nonpersisted_resource_action?,
                    :resource_action?, :save_action?, :tila_action?
    end

    class_methods do
      # Actions that operate on a set of resources
      def resources_actions
        [:index]
      end

      # Actions that operate on a single persisted resource
      def persisted_resource_actions
        [:show, :edit, :update]
      end

      # Actions that operate on a single not-yet-persisted resource
      def nonpersisted_resource_actions
        [:new, :create]
      end

      # Actions that operate on a single resource
      def resource_actions
        persisted_resource_actions + nonpersisted_resource_actions
      end

      # Actions that alter a single resource
      def save_actions
        [:create, :update]
      end

      # Actions that Tila should try to handle
      def tila_actions
        resource_actions + resources_actions
      end
    end

    protected

    def resources_action?
      self.class.resources_actions.include? action
    end

    def persisted_resource_action?
      self.class.persisted_resource_actions.include? action
    end

    def nonpersisted_resource_action?
      self.class.nonpersisted_resource_actions.include? action
    end

    def resource_action?
      self.class.resource_actions.include? action
    end

    def save_action?
      self.class.save_actions.include? action
    end

    def tila_action?
      self.class.tila_actions.include? action
    end
  end
end
