require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { build(:post, user: user) }

  it 'is with valid attributes' do
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
  post.title = nil
  expect(post).to_not be_valid
  end

    it 'is invalid with an empty title' do
  post.title = ''
  expect(post).to_not be_valid
  end

  it 'belongs to a user' do
    expect(post.user).to eq(user)
  end

  it 'can have an attached image' do
    post.image.attach(
      io: File.open(Rails.root.join('spec', 'fixtures', 'test-image.jpg')),
      filename: 'test-image.jpg',
      content_type: 'image/jpeg'
    )

    expect(post.image).to be_attached
  end
end
