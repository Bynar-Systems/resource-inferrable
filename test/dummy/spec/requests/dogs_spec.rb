require 'rails_helper'

RSpec.describe 'Dogs', type: :request do
  describe 'GET /dogs' do
    let!(:dogs) { FactoryBot.create_list(:dog, 10) }
    it 'should return dogs content' do
      get dogs_path, params: { page: 1, page_size: 5 }
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      data = json_response
      expect(data[:page]).to eq 1
      expect(data[:page_size]).to eq 5
      expect(data[:total_pages]).to eq 2
      expect(data[:dogs]).to have_attributes(size: 5)
      data[:dogs].each do |dog|
        expect(dog.keys).to contain_exactly(:id, :name, :updated_at, :created_at)
      end
    end
  end

  describe 'POST /dogs' do
    let(:dog_params) { FactoryBot.attributes_for(:dog) }
    it 'should create a dog' do
      post dogs_path, params: JSON.generate(dog_params), headers: { 'CONTENT_TYPE': 'application/json' }
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(json_response.keys).to contain_exactly(:id, :name, :updated_at, :created_at)
    end
  end

  describe 'GET /:id' do
    let(:dog) { FactoryBot.create(:dog) }
    it 'should return requested dog' do
      get dog_path(dog.id)
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(json_response.keys).to contain_exactly(:id, :name, :updated_at, :created_at)
    end
  end

  describe 'PUT /:id' do
    let(:dog) { FactoryBot.create(:dog) }
    it 'should update name' do
      put dog_path(dog.id), params: JSON.generate({ name: 'new name' }), headers: { 'CONTENT_TYPE': 'application/json' }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      dog.reload
      expect(dog.name).to eq('new name')
    end
  end

  describe 'DELETE /:id' do
    let(:dog) { FactoryBot.create(:dog) }
    it 'should delete dog' do
      dog_id = dog.id
      delete dog_path(dog_id)
      expect(response).to have_http_status(:no_content)
      expect(Dog.where(id: dog_id).count).to eq 0
    end
  end
end
