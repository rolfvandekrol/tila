
describe Tila::ActionTypes, type: :controller do
  controller(ApplicationController) do
    include Tila::ActionTypes

    def test_action
      @action = params[:a]

      @resources_action = resources_action?
      @persisted_resource_action = persisted_resource_action?
      @nonpersisted_resource_action = nonpersisted_resource_action?
      @resource_action = resource_action?
      @save_action = save_action?
      @tila_action = tila_action?
      render 'shared/empty'
    end

    protected

    def action
      @action.to_sym
    end
  end

  describe '#resources_action?' do
    it 'accepts index as a resources action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'index'}

      expect(assigns(:resources_action)).to be true
    end

    it 'rejects show as a resources action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'show'}

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects edit as a resources action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'edit'}

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects update as a resources action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'update'}

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects new as a resources action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'new'}

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects create as a resources action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'create'}

      expect(assigns(:resources_action)).to be false
    end

    it 'rejects moo_action as a resources action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'moo_action'}

      expect(assigns(:resources_action)).to be false
    end
  end

  describe '#persisted_resource_action?' do
    it 'rejects index as a persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'index'}

      expect(assigns(:persisted_resource_action)).to be false
    end

    it 'accepts show as a persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'show'}

      expect(assigns(:persisted_resource_action)).to be true
    end

    it 'accepts edit as a persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'edit'}

      expect(assigns(:persisted_resource_action)).to be true
    end

    it 'accepts update as a persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'update'}

      expect(assigns(:persisted_resource_action)).to be true
    end

    it 'rejects new as a persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'new'}

      expect(assigns(:persisted_resource_action)).to be false
    end

    it 'rejects create as a persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'create'}

      expect(assigns(:persisted_resource_action)).to be false
    end

    it 'rejects moo_action as a persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'moo_action'}

      expect(assigns(:persisted_resource_action)).to be false
    end
  end

  describe '#nonpersisted_resource_action?' do
    it 'rejects index as a non persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'index'}

      expect(assigns(:nonpersisted_resource_action)).to be false
    end

    it 'rejects show as a non persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'show'}

      expect(assigns(:nonpersisted_resource_action)).to be false
    end

    it 'rejects edit as a non persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'edit'}

      expect(assigns(:nonpersisted_resource_action)).to be false
    end

    it 'rejects update as a non persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'update'}

      expect(assigns(:nonpersisted_resource_action)).to be false
    end

    it 'accepts new as a non persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'new'}

      expect(assigns(:nonpersisted_resource_action)).to be true
    end

    it 'accepts create as a non persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'create'}

      expect(assigns(:nonpersisted_resource_action)).to be true
    end

    it 'rejects moo_action as a non persisted resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'moo_action'}

      expect(assigns(:nonpersisted_resource_action)).to be false
    end
  end

  describe '#resource_action?' do
    it 'rejects index as a resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'index'}

      expect(assigns(:resource_action)).to be false
    end

    it 'accepts show as a resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'show'}

      expect(assigns(:resource_action)).to be true
    end

    it 'accepts edit as a resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'edit'}

      expect(assigns(:resource_action)).to be true
    end

    it 'accepts update as a resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'update'}

      expect(assigns(:resource_action)).to be true
    end

    it 'accepts new as a resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'new'}

      expect(assigns(:resource_action)).to be true
    end

    it 'accepts create as a resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'create'}

      expect(assigns(:resource_action)).to be true
    end

    it 'rejects moo_action as a resource action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'moo_action'}

      expect(assigns(:resource_action)).to be false
    end
  end

  describe '#save_action?' do
    it 'rejects index as a save action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'index'}

      expect(assigns(:save_action)).to be false
    end

    it 'rejects show as a save action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'show'}

      expect(assigns(:save_action)).to be false
    end

    it 'rejects edit as a save action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'edit'}

      expect(assigns(:save_action)).to be false
    end

    it 'accepts update as a save action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'update'}

      expect(assigns(:save_action)).to be true
    end

    it 'rejects new as a save action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'new'}

      expect(assigns(:save_action)).to be false
    end

    it 'accepts create as a save action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'create'}

      expect(assigns(:save_action)).to be true
    end

    it 'rejects moo_action as a save action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'moo_action'}

      expect(assigns(:save_action)).to be false
    end
  end

  describe '#tila_action?' do
    it 'accepts index as a Tila action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'index'}

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts show as a Tila action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'show'}

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts edit as a Tila action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'edit'}

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts update as a Tila action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'update'}

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts new as a Tila action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'new'}

      expect(assigns(:tila_action)).to be true
    end

    it 'accepts create as a Tila action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'create'}

      expect(assigns(:tila_action)).to be true
    end

    it 'rejects moo_action as a Tila action' do
      routes.draw { get "test_action" => "anonymous#test_action" }
      get :test_action, {a: 'moo_action'}

      expect(assigns(:tila_action)).to be false
    end
  end
end
