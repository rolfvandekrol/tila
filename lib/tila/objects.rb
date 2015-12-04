module Tila
  module Objects
    extend ActiveSupport::Concern

    included do
      attr_accessor :object, :collection
      helper_method :object, :collection
    end
  end
end