# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Create a dummy user
user = FactoryBot.create(:user)

# Create dummy posts for that user
5.times do
  FactoryBot.create(:post, user: user)
end

# Create dummy articles for that user
3.times do
  FactoryBot.create(:article, user: user)
end

# Create dummy comments (attached to existing articles and user)
Article.all.each do |article|
  2.times do
    FactoryBot.create(:comment, article: article, user: user)
  end
end
