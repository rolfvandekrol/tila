
describe Tila::Modelable, type: :controller do
  controller(Admin::BunniesController) do
    include Tila::Modelable

    def test_action
      @model = model
      @object_name = object_name
      @objects_name = objects_name
      @model_name = model_name
      render 'shared/empty'
    end
  end

  it 'exposes model helper' do
    routes.draw { get "test_action" => "admin/bunnies#test_action" }
    get :test_action

    expect(assigns(:model)).to eq(Admin::Bunny)
    expect(assigns(:object_name)).to eq('bunny')
    expect(assigns(:objects_name)).to eq('bunnies')
    expect(assigns(:model_name)).to eq('admin_bunny')
  end
end
