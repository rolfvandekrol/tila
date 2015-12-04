module Tila
  module SaveDestroy
    extend ActiveSupport::Concern
    include Objects

    def save_object
      object.save
    end

    def destroy_object
      object.destroy
    end
  end
end