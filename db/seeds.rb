# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(email: 'JohnDoe@example.com') do |u|
  u.password = 'password'
end

5.times do
  post = Post.create!(title: 'Posting for blog', user: user)

  post.image.attach(
    io: File.open(Rails.root.join('spec/fixtures/test-image.jpg')),
    filename: "test-image.jpg",
    content_type: "image/jpeg"
  )
end

description = "This is where the article content would go. The modern web development landscape is rapidly evolving with new frameworks, tools, and methodologies emerging constantly.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.

"
3.times do
  article = Article.create!(title: 'The Future of Web Development', body: description, status: 'public', user: user)
  2.times do
    Comment.create!(body: 'Will nail ROR in the next couple of months :) ', status: 'public', article: article, user: user)
  end
end
