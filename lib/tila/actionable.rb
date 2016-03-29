module Tila
  module Actionable
    extend ActiveSupport::Concern

    included do
      helper_method :action
    end

    protected

    def action
      params[:action].to_sym
    end
  end
end
