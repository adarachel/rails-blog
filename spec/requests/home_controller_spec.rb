require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /' do
    it 'renders the index template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'has a 200 status code' do
      get '/'
      expect(response).to have_http_status(200)
    end

    it 'includes correct placeholder text' do
      get '/'
      expect(response.body).to include('Welcome to My Blog')
    end
  end
end
