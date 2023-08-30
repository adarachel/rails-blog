require 'rails_helper'

RSpec.feature 'User Show Page' do
  scenario 'displays user details and posts' do
    user = FactoryBot.create(:user, :user_with_posts)
    visit user_path(user)
    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.posts_counter)
    expect(page).to have_content(user.bio)
    user.recent_posts.each do |post|
      expect(page).to have_content(post.title)
    end
    click_link 'See all Posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
