require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { create(:user) }
  let(:posts) { create(:post) }

  before do
    sign_in user
  end
  describe "POST /likes" do
    subject(:create_like) { post likes_path, params: { like: { post_id: posts.id } } }
    context "when a like is created" do
      it 'creates a like on the first click of the post' do
      expect { create_like }.to change(Like, :count).by(1)
      end
      it 'redirects when a like is successfully created' do
        create_like
        expect(response).to redirect_to posts_path
      end
    end

    context "when the user already liked the post" do
      before { create_like }
      it 'does not create a second like for the same user and post' do
        expect { create_like }.not_to change(Like, :count)
      end
      it 'redirects when a like is not created' do
        create_like
        expect(response).to redirect_to(posts_path)
      end
    end
  end
  describe "DELETE /likes/:id" do
    let!(:like) { user.likes.create!(post_id: posts.id) }

    it 'destroys a like on the second click of the post' do
      expect {
        delete like_path(like.id)
      }.to change(Like, :count).by(-1)
    end

    it 'redirects when a like is destroyed' do
      delete like_path(like.id)
      expect(response).to redirect_to(posts_path)
    end
  end
end
