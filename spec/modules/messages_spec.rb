
describe Tila::Messages, type: :controller do
  controller(BunniesController) do
    include Tila::Messages

    def test_action
      @message_scope = message_scope
      @message = message('moo')
      render 'shared/empty'
    end
  end

  it 'exposes the correct helpers' do
    routes.draw { get "test_action" => "bunnies#test_action" }
    get :test_action

    expect(assigns(:message_scope)).to eq([:activemodel, :messages, 'bunny'])
    expect(assigns(:message)).to eq('Test message')
  end
end