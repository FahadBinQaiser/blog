require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "returns a successful response" do
    get posts_path
    expect(response).to have_http_status(:success)
    end
  end
  describe "POST /posts" do
    let(:user) { create(:user) }
    it "creates a post when a user is signed in" do
      sign_in user
      post posts_path, params: { post: { title: "Controller Tests" } }

      expect(response).to redirect_to(post_path(Post.last))
    follow_redirect!
    expect(response.body).to include("Controller Tests")
    end
  end
end
