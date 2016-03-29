
describe Tila::Actionable, type: :controller do
  controller(ApplicationController) do
    include Tila::Actionable

    def test_action
      @action = action
      render 'shared/empty'
    end

    def index
      @collection_action = collection_action?
      render 'shared/empty'
    end

    def show
      @collection_action = collection_action?
      render 'shared/empty'
    end
  end

  it 'exposes action helper' do
    routes.draw { get "test_action" => "anonymous#test_action" }
    get :test_action

    expect(assigns(:action)).to eq(:test_action)
  end

  it 'recognizes index as collection action' do
    routes.draw { get "index" => "anonymous#index" }
    get :index
    expect(assigns(:collection_action)).to be true
  end

  it 'recognizes show as member action' do
    routes.draw { get "show" => "anonymous#show" }
    get :show
    expect(assigns(:collection_action)).to be false
  end
end
