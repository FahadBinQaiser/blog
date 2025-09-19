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
  end
  describe "DELETE /likes/:id" do
    it 'destroys a like on the second click of the post' do
      post likes_path, params: { like: { post_id: posts.id } }
      like = Like.last
      expect {
         delete like_path(like.id)
      }.to change(Like, :count).by(-1)
  end
  end
end
