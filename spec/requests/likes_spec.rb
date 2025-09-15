require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { create(:user) }
  let(:postBlog) { create(:post) }

  before { sign_in user }
  describe "GET /index" do
    it 'creates a like on the first click of the post' do
      expect {
        post likes_path, params: { like: { post_id: postBlog.id } }
      }.to change(Like, :count).by(1)
    end
  end
end
