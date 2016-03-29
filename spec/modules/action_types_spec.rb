
describe Tila::ActionTypes, type: :controller do
  controller(ApplicationController) do
    include Tila::ActionTypes

    [:index, :show, :edit, :update, :new, :create, :moo_action].each do |a|
      define_method(a) do
        set_vars
        render 'shared/empty'
      end
    end

    protected

    def set_vars
      @resources_action = resources_action?
      @persisted_resource_action = persisted_resource_action?
      @nonpersisted_resource_action = nonpersisted_resource_action?
      @resource_action = resource_action?
      @save_action = save_action?
      @tila_action = tila_action?
    end
  end

  it 'recognizes index correctly' do
    routes.draw { get "index" => "anonymous#index" }
    get :index

    expect(assigns(:resources_action)).to be true
    expect(assigns(:persisted_resource_action)).to be false
    expect(assigns(:nonpersisted_resource_action)).to be false
    expect(assigns(:resource_action)).to be false
    expect(assigns(:save_action)).to be false
    expect(assigns(:tila_action)).to be true
  end

  it 'recognizes show correctly' do
    routes.draw { get "show" => "anonymous#show" }
    get :show

    expect(assigns(:resources_action)).to be false
    expect(assigns(:persisted_resource_action)).to be true
    expect(assigns(:nonpersisted_resource_action)).to be false
    expect(assigns(:resource_action)).to be true
    expect(assigns(:save_action)).to be false
    expect(assigns(:tila_action)).to be true
  end

  it 'recognizes edit correctly' do
    routes.draw { get "edit" => "anonymous#edit" }
    get :edit

    expect(assigns(:resources_action)).to be false
    expect(assigns(:persisted_resource_action)).to be true
    expect(assigns(:nonpersisted_resource_action)).to be false
    expect(assigns(:resource_action)).to be true
    expect(assigns(:save_action)).to be false
    expect(assigns(:tila_action)).to be true
  end

  it 'recognizes update correctly' do
    routes.draw { get "update" => "anonymous#update" }
    get :update

    expect(assigns(:resources_action)).to be false
    expect(assigns(:persisted_resource_action)).to be true
    expect(assigns(:nonpersisted_resource_action)).to be false
    expect(assigns(:resource_action)).to be true
    expect(assigns(:save_action)).to be true
    expect(assigns(:tila_action)).to be true
  end

  it 'recognizes new correctly' do
    routes.draw { get "new" => "anonymous#new" }
    get :new

    expect(assigns(:resources_action)).to be false
    expect(assigns(:persisted_resource_action)).to be false
    expect(assigns(:nonpersisted_resource_action)).to be true
    expect(assigns(:resource_action)).to be true
    expect(assigns(:save_action)).to be false
    expect(assigns(:tila_action)).to be true
  end

  it 'recognizes create correctly' do
    routes.draw { get "create" => "anonymous#create" }
    get :create

    expect(assigns(:resources_action)).to be false
    expect(assigns(:persisted_resource_action)).to be false
    expect(assigns(:nonpersisted_resource_action)).to be true
    expect(assigns(:resource_action)).to be true
    expect(assigns(:save_action)).to be true
    expect(assigns(:tila_action)).to be true
  end

  it 'recognizes moo_action correctly' do
    routes.draw { get "moo_action" => "anonymous#moo_action" }
    get :moo_action

    expect(assigns(:resources_action)).to be false
    expect(assigns(:persisted_resource_action)).to be false
    expect(assigns(:nonpersisted_resource_action)).to be false
    expect(assigns(:resource_action)).to be false
    expect(assigns(:save_action)).to be false
    expect(assigns(:tila_action)).to be false
  end
end
