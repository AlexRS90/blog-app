require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'get base page, index action' do
      get '/users/213/posts'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('213')
    end
  end
end
