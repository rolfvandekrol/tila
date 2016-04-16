
describe Tila::Storage, type: :controller do
  controller(ApplicationController) do
    include Tila::Storage

    def test_action1
      @resource_storage_base = resource_storage_base
      render 'shared/empty'
    end

    def test_action2
      @persisted_resource_identifier = persisted_resource_identifier
      render 'shared/empty'
    end

    def test_action3
      @retrieved_resources = retrieve_resources
      render 'shared/empty'
    end

    def test_action4
      @retrieved_persisted_resource = retrieve_persisted_resource
      render 'shared/empty'
    end

    def test_action5
      @built_nonpersisted_resource = build_nonpersisted_resource
      render 'shared/empty'
    end

    def test_action6
      @kitten = build_nonpersisted_resource
      persist_resource(@kitten)
      render 'shared/empty'
    end

    def test_action7
      @kitten = Kitten.find(params[:id])
      unpersist_resource(@kitten)
      render 'shared/empty'
    end

    def test_action8
      @kitten = Kitten.new
      update_resource_attributes(@kitten, {name: 'Pippin', tail_length: 29})
      render 'shared/empty'
    end

    protected

    def model
      Kitten
    end
  end

  describe '#resource_storage_base' do
    it 'returns the model' do
      routes.draw { get 'test_action1' => 'anonymous#test_action1' }
      get :test_action1
      expect(assigns(:resource_storage_base)).to be Kitten
    end
  end

  describe '#persisted_resource_identifier' do
    before(:each) do
      @id = '42'
    end

    it 'returns the id from the params' do
      routes.draw { get 'test_action2' => 'anonymous#test_action2' }
      get :test_action2, id: @id
      expect(assigns(:persisted_resource_identifier)).to eq(@id)
    end
  end

  describe '#retrieve_resources' do
    before(:each) do
      @kitten = Kitten.create
    end

    it 'should contain all the resources' do
      routes.draw { get 'test_action3' => 'anonymous#test_action3' }
      get :test_action3, id: @id
      expect(assigns(:retrieved_resources)).to include(@kitten)
    end
  end

  describe '#retrieve_persisted_resource' do
    before(:each) do
      @kitten = Kitten.create
    end

    it 'should return the specified persisted resource' do
      routes.draw { get 'test_action4' => 'anonymous#test_action4' }
      get :test_action4, id: @kitten.id
      expect(assigns(:retrieved_persisted_resource)).to eq(@kitten)
    end
  end

  describe '#build_nonpersisted_resource' do
    it 'returns a non persisted resource' do
      routes.draw { get 'test_action5' => 'anonymous#test_action5' }
      get :test_action5
      expect(assigns(:built_nonpersisted_resource)).to be_an_instance_of(Kitten)
      expect(assigns(:built_nonpersisted_resource).persisted?).to be_falsey
    end
  end

  describe '#persist_resource' do
    it 'should persist the resource' do
      routes.draw { get 'test_action6' => 'anonymous#test_action6' }
      get :test_action6
      expect(assigns(:kitten)).to be_an_instance_of(Kitten)
      expect(assigns(:kitten).persisted?).to be_truthy
    end
  end

  describe '#unpersist_resource' do
    before(:each) do
      @kitten = Kitten.create
    end

    it 'should unpersist the resource' do
      routes.draw { get 'test_action7' => 'anonymous#test_action7' }
      get :test_action7, id: @kitten.id
      expect(assigns(:kitten)).to be_an_instance_of(Kitten)
      expect(assigns(:kitten).persisted?).to be_falsey
    end
  end

  describe '#update_resource_attributes' do
    it 'should update the attributes of the resource' do
      routes.draw { get 'test_action8' => 'anonymous#test_action8' }
      get :test_action8
      expect(assigns(:kitten)).to be_an_instance_of(Kitten)
      expect(assigns(:kitten).name).to eq('Pippin')
      expect(assigns(:kitten).tail_length).to eq(29)
    end
  end
end
