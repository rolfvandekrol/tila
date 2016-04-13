
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

  describe '#resources_action?' do
    it 'accepts index as a resources action' do
      routes.draw { get "index" => "anonymous#index" }
      get :index

      expect(assigns(:resources_action)).to be true
    end

    it 'rejects show as a resources action' do
      routes.draw { get "show" => "anonymous#show" }
      get :show

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects edit as a resources action' do
      routes.draw { get "edit" => "anonymous#edit" }
      get :edit

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects update as a resources action' do
      routes.draw { get "update" => "anonymous#update" }
      get :update

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects new as a resources action' do
      routes.draw { get "new" => "anonymous#new" }
      get :new

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects create as a resources action' do
      routes.draw { get "create" => "anonymous#create" }
      get :create

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects moo_action as a resources action' do
      routes.draw { get "moo_action" => "anonymous#moo_action" }
      get :moo_action

      expect(assigns(:resources_action)).to be false
    end
  end

  describe '#persisted_resource_action?' do
    it 'rejects index as a persisted resource action' do
      routes.draw { get "index" => "anonymous#index" }
      get :index

      expect(assigns(:persisted_resource_action)).to be false
    end

    it 'accepts show as a persisted resource action' do
      routes.draw { get "show" => "anonymous#show" }
      get :show

      expect(assigns(:persisted_resource_action)).to be true
    end

    it 'accepts edit as a persisted resource action' do
      routes.draw { get "edit" => "anonymous#edit" }
      get :edit

      expect(assigns(:persisted_resource_action)).to be true
    end

    it 'accepts update as a persisted resource action' do
      routes.draw { get "update" => "anonymous#update" }
      get :update

      expect(assigns(:persisted_resource_action)).to be true
    end

    it 'rejects new as a persisted resource action' do
      routes.draw { get "new" => "anonymous#new" }
      get :new

      expect(assigns(:persisted_resource_action)).to be false
    end

    it 'rejects create as a persisted resource action' do
      routes.draw { get "create" => "anonymous#create" }
      get :create

      expect(assigns(:persisted_resource_action)).to be false
    end

    it 'rejects moo_action as a persisted resource action' do
      routes.draw { get "moo_action" => "anonymous#moo_action" }
      get :moo_action

      expect(assigns(:persisted_resource_action)).to be false
    end
  end

  describe '#nonpersisted_resource_action?' do
    it 'rejects index as a non persisted resource action' do
      routes.draw { get "index" => "anonymous#index" }
      get :index

      expect(assigns(:nonpersisted_resource_action)).to be false
    end

    it 'rejects show as a non persisted resource action' do
      routes.draw { get "show" => "anonymous#show" }
      get :show

      expect(assigns(:nonpersisted_resource_action)).to be false
    end

    it 'rejects edit as a non persisted resource action' do
      routes.draw { get "edit" => "anonymous#edit" }
      get :edit

      expect(assigns(:nonpersisted_resource_action)).to be false
    end

    it 'rejects update as a non persisted resource action' do
      routes.draw { get "update" => "anonymous#update" }
      get :update

      expect(assigns(:nonpersisted_resource_action)).to be false
    end

    it 'accepts new as a non persisted resource action' do
      routes.draw { get "new" => "anonymous#new" }
      get :new

      expect(assigns(:nonpersisted_resource_action)).to be true
    end

    it 'accepts create as a non persisted resource action' do
      routes.draw { get "create" => "anonymous#create" }
      get :create

      expect(assigns(:nonpersisted_resource_action)).to be true
    end

    it 'rejects moo_action as a non persisted resource action' do
      routes.draw { get "moo_action" => "anonymous#moo_action" }
      get :moo_action

      expect(assigns(:nonpersisted_resource_action)).to be false
    end
  end

  describe '#resource_action?' do
    it 'rejects index as a resource action' do
      routes.draw { get "index" => "anonymous#index" }
      get :index

      expect(assigns(:resource_action)).to be false
    end

    it 'accepts show as a resource action' do
      routes.draw { get "show" => "anonymous#show" }
      get :show

      expect(assigns(:resource_action)).to be true
    end

    it 'accepts edit as a resource action' do
      routes.draw { get "edit" => "anonymous#edit" }
      get :edit

      expect(assigns(:resource_action)).to be true
    end

    it 'accepts update as a resource action' do
      routes.draw { get "update" => "anonymous#update" }
      get :update

      expect(assigns(:resource_action)).to be true
    end

    it 'accepts new as a resource action' do
      routes.draw { get "new" => "anonymous#new" }
      get :new

      expect(assigns(:resource_action)).to be true
    end

    it 'accepts create as a resource action' do
      routes.draw { get "create" => "anonymous#create" }
      get :create

      expect(assigns(:resource_action)).to be true
    end

    it 'rejects moo_action as a resource action' do
      routes.draw { get "moo_action" => "anonymous#moo_action" }
      get :moo_action

      expect(assigns(:resource_action)).to be false
    end
  end

  describe '#save_action?' do
    it 'rejects index as a save action' do
      routes.draw { get "index" => "anonymous#index" }
      get :index

      expect(assigns(:save_action)).to be false
    end

    it 'rejects show as a save action' do
      routes.draw { get "show" => "anonymous#show" }
      get :show

      expect(assigns(:save_action)).to be false
    end

    it 'rejects edit as a save action' do
      routes.draw { get "edit" => "anonymous#edit" }
      get :edit

      expect(assigns(:save_action)).to be false
    end

    it 'accepts update as a save action' do
      routes.draw { get "update" => "anonymous#update" }
      get :update

      expect(assigns(:save_action)).to be true
    end

    it 'rejects new as a save action' do
      routes.draw { get "new" => "anonymous#new" }
      get :new

      expect(assigns(:save_action)).to be false
    end

    it 'accepts create as a save action' do
      routes.draw { get "create" => "anonymous#create" }
      get :create

      expect(assigns(:save_action)).to be true
    end

    it 'rejects moo_action as a save action' do
      routes.draw { get "moo_action" => "anonymous#moo_action" }
      get :moo_action

      expect(assigns(:save_action)).to be false
    end
  end

  describe '#tila_action?' do
    it 'accepts index as a Tila action' do
      routes.draw { get "index" => "anonymous#index" }
      get :index

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts show as a Tila action' do
      routes.draw { get "show" => "anonymous#show" }
      get :show

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts edit as a Tila action' do
      routes.draw { get "edit" => "anonymous#edit" }
      get :edit

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts update as a Tila action' do
      routes.draw { get "update" => "anonymous#update" }
      get :update

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts new as a Tila action' do
      routes.draw { get "new" => "anonymous#new" }
      get :new

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts create as a Tila action' do
      routes.draw { get "create" => "anonymous#create" }
      get :create

      expect(assigns(:tila_action)).to be true
    end

    it 'rejects moo_action as a Tila action' do
      routes.draw { get "moo_action" => "anonymous#moo_action" }
      get :moo_action

      expect(assigns(:tila_action)).to be false
    end
  end
end
