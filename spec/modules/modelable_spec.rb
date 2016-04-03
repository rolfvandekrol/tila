
describe Tila::Modelable, type: :controller do
  controller(BunniesController) do
    include Tila::Modelable

    def test_action
      @model = model
      @resource_name = resource_name
      @resources_name = resources_name
      @model_name = model_name
      render 'shared/empty'
    end
  end

  it 'exposes the correct helpers' do
    routes.draw { get "test_action" => "bunnies#test_action" }
    get :test_action

    expect(assigns(:model)).to eq(Bunny)
    expect(assigns(:resource_name)).to eq('bunny')
    expect(assigns(:resources_name)).to eq('bunnies')
    expect(assigns(:model_name)).to eq('bunny')
  end
end

describe Tila::Modelable, type: :controller do
  controller(Admin::BunniesController) do
    include Tila::Modelable

    def test_action
      @model = model
      @resource_name = resource_name
      @resources_name = resources_name
      @model_name = model_name
      render 'shared/empty'
    end
  end

  it 'exposes model helper' do
    routes.draw { get "test_action" => "admin/bunnies#test_action" }
    get :test_action

    expect(assigns(:model)).to eq(Admin::Bunny)
    expect(assigns(:resource_name)).to eq('bunny')
    expect(assigns(:resources_name)).to eq('bunnies')
    expect(assigns(:model_name)).to eq('admin_bunny')
  end
end
