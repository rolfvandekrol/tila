
describe Tila::Messages, type: :controller do
  controller(BunniesController) do
    include Tila::Params

    def test_action
      @resource_params_name = resource_params_name
      @resource_params = resource_params
      render 'shared/empty'
    end

    def test_action_raise1
      @permitted_resource_params_list = permitted_resource_params_list
      render 'shared/empty'
    end

    def test_action_raise2
      @permitted_resource_params = permitted_resource_params
      render 'shared/empty'
    end
  end

  it 'exposes the correct helpers' do
    routes.draw {
      get "test_action" => "bunnies#test_action"
      get "test_action_raise1" => "bunnies#test_action_raise1"
      get "test_action_raise2" => "bunnies#test_action_raise2"
    }

    get :test_action, {bunny: {name: 'Oliver'}}
    expect(assigns(:resource_params_name)).to eq('bunny')
    expect(assigns(:resource_params)).to be_a(Hash)
    expect(assigns(:resource_params)[:name]).to eq('Oliver')

    expect {
      get :test_action_raise1, {bunny: {name: 'Oliver'}}
    }.to raise_error(NotImplementedError)

    expect {
      get :test_action_raise2, {bunny: {name: 'Oliver'}}
    }.to raise_error(NotImplementedError)
  end
end

describe Tila::Messages, type: :controller do
  controller(BunniesController) do
    include Tila::Params

    def test_action1
      @permitted_resource_params_list = permitted_resource_params_list
      render 'shared/empty'
    end

    def test_action2
      @permitted_resource_params = permitted_resource_params
      render 'shared/empty'
    end

    protected

    def permitted_resource_params_list
      [:name]
    end
  end

  it 'exposes the correct helpers' do
    routes.draw {
      get "test_action1" => "bunnies#test_action1"
      get "test_action2" => "bunnies#test_action2"
    }

    get :test_action1
    expect(assigns(:permitted_resource_params_list)).to eq([:name])

    get :test_action2, {bunny: {name: 'Oliver'}}
    expect(assigns(:permitted_resource_params)[:name]).to eq('Oliver')
  end
end

describe Tila::Messages, type: :controller do
  controller(BunniesController) do
    include Tila::Params

    def test_action
      update_resource_params(bunny)
      render 'shared/empty'
    end

    protected

    def bunny
      @bunny ||= Bunny.new
    end

    def permitted_resource_params_list
      [:name]
    end
  end

  it 'exposes the correct helpers' do
    routes.draw {
      get "test_action" => "bunnies#test_action"
    }

    get :test_action, {bunny: {name: 'Oliver', fluffiness: 42}}
    expect(assigns(:bunny)).to be_a Bunny
    expect(assigns(:bunny).name).to eq('Oliver')
    expect(assigns(:bunny).fluffiness).to be_nil
  end
end
