
describe Tila::Actionable do
  describe '#action', type: :controller do
    controller(ApplicationController) do
      include Tila::Actionable

      def test_action
        @action = action
        render 'shared/empty'
      end
    end

    it 'returns the current action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action

      expect(assigns(:action)).to eq(:test_action)
    end
  end
end
