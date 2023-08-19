# seed_data.rb

# Your existing code for creating users and posts
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)

# Command to create post comments
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
