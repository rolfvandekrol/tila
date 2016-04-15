module Tila
  module Messages
    extend ActiveSupport::Concern

    included do
      helper_method :message, :message_scope, :message_base_scope
    end

    protected

    def message(message_key)
      t(message_key, scope: message_scope)
    end

    def message_scope
      [model.i18n_scope, :messages, model.model_name.i18n_key]
    end
  end
end
