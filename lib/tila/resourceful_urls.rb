module Tila
  module ResourcefulUrls
    extend ActiveSupport::Concern
    include Modelable

    included do
      helper_method :object_url, :collection_url
    end

    protected

    def route_key_singular
      model.model_name.element
    end

    def route_key_plural
      route_key_singular.pluralize == route_key_singular ? "#{route_key_singular.pluralize}_index" : route_key_singular.pluralize
    end

    def object_url(object = nil, options = {})
      target = object ? object : self.object

      send "#{route_key_singular}_url", target, options
    end

    def collection_url(options = {})
      send "#{route_key_plural}_url", options
    end
  end
end
