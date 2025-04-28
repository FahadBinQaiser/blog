require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let!(:article) { Article.create!(title: "Hello Pookie", body: "Pookie body", status: "public") }

  describe "GET #index" do
    it "returns a success response" do
      get articles_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "shows the article successfully" do
      get article_path(article)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new article" do
      expect {
        post articles_path, params: { article: { title: "New Pookie", body: "Learning again!", status: "public" } }
      }.to change(Article, :count).by(1)
      expect(response).to have_http_status(:redirect) 
    end
  end

  describe "DELETE #destroy" do
    it "deletes an article" do
      expect {
        delete article_path(article)
      }.to change(Article, :count).by(-1)
      expect(response).to have_http_status(:redirect) 
    end
  end
end
