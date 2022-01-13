require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:example) { get user_posts_path(user_id: 1) } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it ' response body to include list of posts' do
      expect(response.body).to include 'List Of Posts'
    end
  end
  describe 'GET /posts/:id' do
    before(:example) { get user_post_path(user_id: 1, id: 1) } # get(:show)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
    it ' response body to include post details' do
      expect(response.body).to include 'Post Information'
    end
  end
end
