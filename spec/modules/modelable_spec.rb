
describe Tila::Modelable, type: :controller do
  context 'included in root level controller', type: :controller do
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

    describe '#model' do
      it 'returns the model derived from the controller name' do
        routes.draw { get "test_action" => "bunnies#test_action" }
        get :test_action

        expect(assigns(:model)).to eq(Bunny)
      end
    end

    describe '#resource_name' do
      it 'returns the resource name derived from the controller name' do
        routes.draw { get "test_action" => "bunnies#test_action" }
        get :test_action

        expect(assigns(:resource_name)).to eq('bunny')
      end
    end

    describe '#resources_name' do
      it 'returns the resources name derived from the controller name' do
        routes.draw { get "test_action" => "bunnies#test_action" }
        get :test_action

        expect(assigns(:resources_name)).to eq('bunnies')
      end
    end

    describe '#model_name' do
      it 'returns the model name derived from the controller name' do
        routes.draw { get "test_action" => "bunnies#test_action" }
        get :test_action

        expect(assigns(:model_name)).to eq('bunny')
      end
    end
  end

  context 'included in namespaced controller', type: :controller do
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

    describe '#model' do
      it 'returns the namespaced model derived from the controller name' do
        routes.draw { get "test_action" => "admin/bunnies#test_action" }
        get :test_action

        expect(assigns(:model)).to eq(Admin::Bunny)
      end
    end

    describe '#resource_name' do
      it 'returns the resource name derived from the controller name, without the namespace' do
        routes.draw { get "test_action" => "admin/bunnies#test_action" }
        get :test_action

        expect(assigns(:resource_name)).to eq('bunny')
      end
    end

    describe '#resources_name' do
      it 'returns the resources name derived from the controller name, without the namespace' do
        routes.draw { get "test_action" => "admin/bunnies#test_action" }
        get :test_action

        expect(assigns(:resources_name)).to eq('bunnies')
      end
    end

    describe '#model_name' do
      it 'returns the model name derived from the controller name, including the namespace' do
        routes.draw { get "test_action" => "admin/bunnies#test_action" }
        get :test_action

        expect(assigns(:model_name)).to eq('admin_bunny')
      end
    end
  end
end
