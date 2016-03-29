
describe Tila::ActionTypes, type: :controller do
  controller(ApplicationController) do
    include Tila::ActionTypes

    def index
      @collection_action = collection_action?
      render 'shared/empty'
    end

    def show
      @collection_action = collection_action?
      render 'shared/empty'
    end
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
