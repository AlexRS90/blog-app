require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'get index page, root page' do
      get '/'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
    it 'requesting to the /users path should also return the index' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
