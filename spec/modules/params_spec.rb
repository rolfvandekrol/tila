
describe Tila::Params, type: :controller do
  context 'when #permitted_resource_params_list is not implemented' do
    controller(BunniesController) do
      include Tila::Params

      def test_action1
        @resource_params_name = resource_params_name
        render 'shared/empty'
      end

      def test_action2
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

    describe '#resource_params_name' do
      it 'returns the resource params name from the model' do
        routes.draw { get "test_action1" => "bunnies#test_action1" }
        get :test_action1
        expect(assigns(:resource_params_name)).to eq('bunny')
      end
    end

    describe '#resource_params' do
      it 'returns the resource params from the params' do
        routes.draw { get "test_action2" => "bunnies#test_action2" }
        get :test_action2, {bunny: {name: 'Oliver', fluffiness: 42}}
        expect(assigns(:resource_params)).to be_a(Hash)
        expect(assigns(:resource_params)[:fluffiness]).to eq('42')
        expect(assigns(:resource_params)[:name]).to eq('Oliver')
      end
    end

    describe '#permitted_resource_params_list' do
      it 'raises a NotImplementedError' do
        routes.draw { get "test_action_raise1" => "bunnies#test_action_raise1" }
        expect {
          get :test_action_raise1, {bunny: {name: 'Oliver'}}
        }.to raise_error(NotImplementedError)
      end
    end

    describe '#permitted_resource_params' do
      it 'raises a NotImplementedError' do
        routes.draw { get "test_action_raise2" => "bunnies#test_action_raise2" }
        expect {
          get :test_action_raise2, {bunny: {name: 'Oliver'}}
        }.to raise_error(NotImplementedError)
      end
    end
  end

  context 'when #permitted_resource_params_list is implemented' do
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

    describe '#permitted_resource_params_list' do
      it 'returns the list of permitted resource param names' do
        routes.draw { get "test_action1" => "bunnies#test_action1" }
        get :test_action1
        expect(assigns(:permitted_resource_params_list)).to eq([:name])
      end
    end

    describe '#permitted_resource_params' do
      it 'returns the permitted resource params from the params' do
        routes.draw { get "test_action2" => "bunnies#test_action2" }
        get :test_action2, {bunny: {name: 'Oliver', fluffiness: 42}}
        expect(assigns(:permitted_resource_params)).to be_a(Hash)
        expect(assigns(:permitted_resource_params)).to have_key(:name)
        expect(assigns(:permitted_resource_params)).not_to have_key(:fluffiness)
        expect(assigns(:permitted_resource_params)[:name]).to eq('Oliver')
      end
    end
  end
end
