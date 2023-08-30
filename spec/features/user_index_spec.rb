require 'rails_helper'

RSpec.feature 'User Index Page' do
  scenario 'displays list of users' do
    user = FactoryBot.create(:user)
    visit users_path
    expect(page).to have_content(user.name)
    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content(user.posts_counter)
    click_link user.name
    expect(current_path).to eq(user_path(user))
  end
end
