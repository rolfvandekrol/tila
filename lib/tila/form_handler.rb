module Tila
  module FormHandler
    extend ActiveSupport::Concern
    include Messages
    include Objects
    include SaveDestroy

    protected

    def handle_form(error_view, message_key)
      respond_to do |format|
        if save_object
          format.html { redirect_to location_after_save, notice: message(message_key) }
          format.json { render :show, status: :created, location: object }
        else
          format.html { render error_view }
          format.json { render json: object.errors, status: :unprocessable_entity }
        end
      end
    end

    def handle_destroy(message_key)
      destroy_object

      respond_to do |format|
        format.html { redirect_to location_after_destroy, notice: message(message_key) }
        format.json { head :no_content }
      end
    end
  end
end
