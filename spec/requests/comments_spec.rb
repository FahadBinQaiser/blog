require 'rails_helper'
require 'devise'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article, user: user) }

  before do
    sign_in user
  end

  describe "POST #create" do
    it "creates a new comment" do
      expect {
        post article_comments_path(article), params: {
          comment: {
            body: "New comment from test",
            status: "public"
          }
        }
      }.to change(Comment, :count).by(1)

      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE #destroy" do
    it "deletes a comment" do
      comment = create(:comment, article: article, user: user)

      expect {
        delete article_comment_path(article, comment)
      }.to change(Comment, :count).by(-1)

      expect(response).to have_http_status(:see_other)
    end
  end
end
