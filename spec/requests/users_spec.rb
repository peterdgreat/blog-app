require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:example) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end
  describe 'GET /users/:id' do
    before(:example) { get user_path(id: 1) } # get(:show)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
    it ' response body to include number of post' do
      expect(response.body).to include 'Number of posts'
    end
  end
end
