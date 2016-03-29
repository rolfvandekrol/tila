module Tila
  module Resourceful
    extend ActiveSupport::Concern
    include ActionTypes
    include Params
    include FormHandler
    include ResourceLoaders
    include ResourcefulUrls

    included do
      before_action :load_resource
      before_action :update_resource_params, only: save_actions
    end

    def index; end
    def show;  end
    def new;   end
    def edit;  end

    def create
      handle_form :new, :created
    end

    def update
      handle_form :edit, :updated
    end

    def destroy
      handle_destroy :destroyed
    end

    protected

    def location_after_save
      object_url
    end

    def location_after_destroy
      collection_url
    end
  end
end
