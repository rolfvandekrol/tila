module Tila
  module ActionHandlers
    protected

    def handle_form_submit(resource, error_view, message, location_after_save)
      respond_to do |format|
        if persist_resource(resource)
          format.html { redirect_to location_after_save, notice: message }
          format.json { render json: resource, status: :created, location: resource }
        else
          format.html { render error_view }
          format.json { render json: resource.errors, status: :unprocessable_entity }
        end
      end
    end

    def handle_destroy(resource, message, location_after_destroy)
      unpersist_resource(resource)

      respond_to do |format|
        format.html { redirect_to location_after_destroy, notice: message }
        format.json { head :no_content }
      end
    end
  end
end
