# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = FactoryBot.create(:user)

5.times do
  FactoryBot.create(:post, user: user)
end

3.times do
  FactoryBot.create(:article, user: user)
end

Article.all.each do |article|
  2.times do
    FactoryBot.create(:comment, article: article, user: user)
  end
end
