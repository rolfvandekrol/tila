module Tila
  module Messages
    extend ActiveSupport::Concern
    include Modelable

    protected
    
    def message(message_key)
      t(message_key, scope: [:activerecord, :messages, model_name])
    end
  end
end