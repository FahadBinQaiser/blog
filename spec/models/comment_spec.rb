require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  it 'has a body' do
    expect(comment.body).to be_present
  end

  it 'shows the body cant be empty' do
    comment.body = ""
    expect(comment.body).to be_empty
  end
end
