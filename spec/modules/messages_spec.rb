
describe Tila::Messages, type: :controller do
  controller(BunniesController) do
    include Tila::Messages

    def test_action
      @message_scope = message_scope
      @message = message('moo')
      render 'shared/empty'
    end
  end

  describe '#message_scope' do
    it 'derives the scope from the model' do
      routes.draw { get "test_action" => "bunnies#test_action" }
      get :test_action
      expect(assigns(:message_scope)).to eq([:activemodel, :messages, 'bunny'])
    end
  end

  describe '#message' do
    it 'retrieves the message from the locale' do
      routes.draw { get "test_action" => "bunnies#test_action" }
      get :test_action
      expect(assigns(:message)).to eq('Test message')
    end
  end
end
