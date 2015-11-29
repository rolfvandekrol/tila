module Tila
  module Actionable
    extend ActiveSupport::Concern

    included do
      helper_method :action
    end

    class_methods do
      def collection_actions
        [:index]
      end

      def new_actions
        [:new, :create]
      end

      def save_actions
        [:create, :update]
      end
    end

    protected

    def action
      params[:action].to_sym
    end

    def collection_action?
      self.class.collection_actions.include? action
    end
    def new_action?
      self.class.new_actions.include? action
    end
    def save_action?
      self.class.save_actions.include? action
    end

    def member_action?
      !collection_action?
    end
  end
end