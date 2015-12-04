module Tila
  module ResourcefulUrls
    extend ActiveSupport::Concern
    include Modelable

    included do
      helper_method :object_url, :collection_url
    end

    protected

    def object_url(object = nil, options = {})
      target = object ? object : self.object

      send "#{model.model_name.route_key.singularize}_url", target, options
    end

    def collection_url(options = {})
      send "#{model.model_name.route_key}_url", options
    end
  end
end