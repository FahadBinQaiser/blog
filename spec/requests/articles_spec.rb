require 'rails_helper'
require 'devise'

RSpec.describe "Articles", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article, user: user) }

  before do
    get articles_path
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
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
    article = create(:article, user: user)
    sign_in user

    expect {
      delete article_path(article)
    }.to change(Article, :count).by(-1)

    expect(response).to have_http_status(:see_other)
  end
end
end
