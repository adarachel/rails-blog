require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'John Doe') }

    it 'renders the show template' do
      get "/users/#{user.id}" # Directly specify the path
      expect(response).to render_template(:show)
    end

    it 'has a 200 status code' do
      get "/users/#{user.id}" # Directly specify the path
      expect(response).to have_http_status(200)
    end

    it 'includes correct placeholder text' do
      get "/users/#{user.id}" # Directly specify the path
      expect(response.body).to include(user.name)
    end
  end

  # Similar specs for other actions...
end
