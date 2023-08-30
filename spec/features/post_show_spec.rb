require 'rails_helper'

RSpec.feature 'Post Show Page' do
  scenario 'displays post details and comments' do
    post = FactoryBot.create(:post, :with_comments)
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.author.name)
    expect(page).to have_content(post.comment_counter)
    expect(page).to have_content(post.likes_counter)
    expect(page).to have_content(post.text)
    post.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
      expect(page).to have_content(comment.text)
    end
  end
end
