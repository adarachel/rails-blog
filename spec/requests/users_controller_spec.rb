require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'John Doe') }

    it 'renders the show template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'has a 200 status code' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end

    it 'includes correct placeholder text' do
      get "/users/#{user.id}"
      expect(response.body).to include(user.name)
    end
  end

  describe 'GET /users' do
    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'has a 200 status code' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'assigns @users with all users' do
      user1 = User.create(name: 'Alice')
      user2 = User.create(name: 'Bob')

      get '/users'
      expect(assigns(:users)).to match_array([user1, user2])
    end

    it 'includes correct user names' do
      user1 = User.create(name: 'Alice')
      user2 = User.create(name: 'Bob')

      get '/users'
      expect(response.body).to include(user1.name)
      expect(response.body).to include(user2.name)
    end
  end

  # Similar specs for other actions...
end
