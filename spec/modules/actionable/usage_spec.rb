
describe Tila::Actionable, type: :controller do
  controller(ApplicationController) do
    include Tila::Actionable

    def test_action
      @action = action
      render 'shared/empty'
    end
  end

  it 'exposes action helper' do
    routes.draw { get "test_action" => "anonymous#test_action" }
    get :test_action

    expect(assigns(:action)).to eq(:test_action)
  end
end
