
describe Tila::Messages, type: :controller do
  controller(ApplicationController) do
    include Tila::Messages

    def test_action
      @message_scope = message_scope
      @message = message('moo')
      render 'shared/empty'
    end

    protected

    def model
      Bunny
    end
  end

  describe '#message_scope' do
    it 'derives the scope from the model' do
      routes.draw { get 'test_action' => 'anonymous#test_action' }
      get :test_action
      expect(assigns(:message_scope)).to eq([:activemodel, :messages, :bunny])
    end
  end

  describe '#message' do
    it 'retrieves the message from the locale' do
      routes.draw { get 'test_action' => 'anonymous#test_action' }
      get :test_action
      expect(assigns(:message)).to eq('Test message')
    end
  end
end
