require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { create(:user) }
  let(:posts) { create(:post) }

  before do
    sign_in user
  end
  describe "POST /index" do
    it 'creates a like on the first click of the post' do
      expect {
        post likes_path, params: { like: { post_id: posts.id } }
      }.to change(Like, :count).by(1)
    end
    it 'does not create a second like for the same user and post' do
      post likes_path, params: { like: { post_id: posts.id } }
      expect {
        post likes_path, params: { like: { post_id: posts.id } }
    }.not_to change(Like, :count)
    end
    it 'redirects when a like is successfully created' do
      post likes_path, params: { like: { post_id: posts.id } }
      expect(response).to redirect_to posts_path
    end
    it 'redirects when a like is not created' do
      post likes_path, params: { like: { post_id: posts.id } }
      post likes_path, params: { like: { post_id: posts.id } }
      expect(response).to redirect_to(posts_path)
    end
  end
  describe "DELETE /likes/:id" do
    it 'destroys a like on the second click of the post' do
      post likes_path, params: { like: { post_id: posts.id } }
      like = Like.last
      expect {
         delete like_path(like.id)
      }.to change(Like, :count).by(-1)
  end
    it 'redirects when a like is destroyed on second click' do
      post likes_path, params: { like: { post_id: posts.id } }
      like = Like.last
      delete like_path(like.id)
      expect(response).to redirect_to posts_path
    end
  end
end
