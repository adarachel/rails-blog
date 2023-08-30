require 'rails_helper'

RSpec.feature 'User Posts Index Page' do
  scenario 'displays user details and posts' do
    user = FactoryBot.create(:user, :user_with_posts)
    visit user_posts_path(user)

    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.posts_counter)

    user.authored_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text[0..10]) # Displaying part of the post text
      expect(page).to have_content("Comments: #{post.comment_counter}")
      expect(page).to have_content("Likes: #{post.likes_counter}")
      expect(page).to have_content(post.comments.first.text) if post.comments.any?
    end

    click_link user.authored_posts.first.title
    expect(current_path).to eq(user_post_path(user, user.authored_posts.first))
  end
end
