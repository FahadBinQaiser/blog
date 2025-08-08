# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(email: 'test@example.com') do |u|
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

3.times do
  article = Article.create!(title: 'Article seeding', body: 'Working on seeding an article', status: 'public', user: user)
  2.times do
    Comment.create!(body: 'Nice article!', status: 'public', article: article, user: user)
  end
end
