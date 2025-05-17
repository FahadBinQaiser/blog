require 'rails_helper'
require 'devise'

RSpec.describe "Articles", type: :request do
  let(:user) { User.create!(email: "test@example.com", password: "password") }

  before do
    sign_in user
  end

  describe "POST #create" do
    it "creates a new article" do
      expect {
        post articles_path, params: { article: { title: "New Pookie", body: "Learning again!", status: "public", user_id: user.id } }
      }.to change(Article, :count).by(1)

      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE #destroy" do
    it "deletes an article" do
      article = Article.create!(title: "Will delete this later", body: "Deletion on hold", status: "public", user: user)

      expect {
        delete article_path(article)
      }.to change(Article, :count).by(-1)

      expect(response).to have_http_status(:see_other)
    end
  end
end
