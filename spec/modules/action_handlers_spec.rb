
describe Tila::ActionHandlers, type: :controller do

  describe '#handle_form_submit' do
    context 'when #persist_resource succeeds' do
      controller(ApplicationController) do
        include Tila::ActionHandlers

        def test_action
          handle_form_submit(
            Kitten.new(name: 'Pippin'),
            'shared/empty',
            'Kittens are fluffy',
            '/'
          )
        end

        protected

        def persist_resource(resource)
          resource.save
        end
      end

      context 'when requesting HTML' do
        it 'redirects to location_after_save' do
          routes.draw { get 'test_action' => 'anonymous#test_action' }
          get :test_action
          expect(response).to redirect_to('/')
          expect(flash[:notice]).to eq('Kittens are fluffy')
        end
      end

      context 'when requesting JSON' do
        it 'responds with a JSON response' do
          routes.draw { get 'test_action' => 'anonymous#test_action' }
          get :test_action, format: 'json'

          json_body = JSON.parse(response.body)
          expect(json_body).to be_a Hash
          expect(json_body['name']).to eq 'Pippin'

          expect(response.status).to eq 201
          expect(response.location).to match /\/kittens\/\d+$/
        end
      end
    end

    context 'when #persist_resource fails' do
      controller(ApplicationController) do
        include Tila::ActionHandlers

        def test_action
          handle_form_submit(
            Kitten.new(name: 'Pippin'),
            'shared/empty',
            'Kittens are fluffy',
            '/'
          )
        end

        protected

        def persist_resource(resource)
          false
        end
      end

      context 'when requesting HTML' do
        it 'renders the error view' do
          routes.draw { get 'test_action' => 'anonymous#test_action' }
          get :test_action
          expect(response).not_to redirect_to '/'
        end
      end

      context 'when requesting JSON' do
        it 'responds with a JSON response' do
          routes.draw { get 'test_action' => 'anonymous#test_action' }
          get :test_action, format: 'json'

          expect(response.status).to eq 422

          json_body = JSON.parse(response.body)
          expect(json_body).to eq Hash.new
        end
      end
    end
  end

  describe '#handle_destroy' do
    controller(ApplicationController) do
      include Tila::ActionHandlers

      def test_action
        handle_destroy(
          Bunny.new,
          'Bunnies are even more fluffy',
          '/'
        )
      end

      protected

      def unpersist_resource(resource)
      end
    end

    context 'when requesting HTML' do
      it 'redirects to location_after_destroy' do
        routes.draw { get 'test_action' => 'anonymous#test_action' }
        get :test_action
        expect(response).to redirect_to('/')
          expect(flash[:notice]).to eq('Bunnies are even more fluffy')
      end
    end

    context 'when requesting JSON' do
      it 'responds with an empty JSON response' do
        routes.draw { get 'test_action' => 'anonymous#test_action' }
        get :test_action, format: 'json'

        expect(response.status).to eq 204
        expect(response.body).to be_empty
      end
    end
  end
end
