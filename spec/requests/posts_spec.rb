require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET index' do
    it 'returns http success' do
      user = User.create(
        name: 'John',
        bio: 'A passionate writer',
        posts_counter: 5,
        photo: 'john.jpg'
      )

      # Your test code here
      # For example: Make a request to the index action
      get '/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      user = User.create(
        name: 'Alice',
        bio: 'An avid reader',
        posts_counter: 3,
        photo: 'alice.jpg'
      )
      post = user.posts.create(
        title: 'My Post Title',
        content: 'Lorem ipsum...'
      )

      # Make a request to the show action
      get post_path(post)
      expect(response).to have_http_status(:success)
    end
  end
end
