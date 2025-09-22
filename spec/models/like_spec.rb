require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:like) { Like.new(user: user, post: post) }
  describe "validations" do
    it 'is valid with a user and a post' do
      expect(like).to be_valid
    end
    it 'is not valid without a user' do
      like = Like.new(user: user)
      expect(like).not_to be_valid
    end
    it 'is not valid without a post' do
      like = Like.new(post: post)
      expect(like).not_to be_valid
    end
    it "does not allow the same user to like the same post twice" do
      Like.create!(user: user, post: post)
      duplicate_like = Like.new(user: user, post: post)
      expect(duplicate_like).not_to be_valid
    end
  end

  describe "database tests" do
    it "increases the count by 1 when a like is created" do
    expect { like.save }.to change(Like, :count).by(1)
    end
    it "decreases the count by 1 when a like is destroyed" do
      like.save
      expect { like.destroy }.to change(Like, :count).by(-1)
    end
  end
end
