require 'rails_helper'

RSpec.describe Like, type: :model do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
  it "increases the count by 1 when a like is created" do
    like = Like.new(user: user, post: post)
    expect { like.save }.to change(Like, :count).by(1)
  end
  it "decreases the count by 1 when a like is destroyed" do
    like = Like.new(user: user, post: post)
    like.save
    expect { like.destroy }.to change(Like, :count).by(-1)
  end
end
