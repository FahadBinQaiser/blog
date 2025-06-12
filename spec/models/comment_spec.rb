require 'rails_helper'

describe CommentsController do
  let(:comment) { create(:comment) }

  it 'has a body' do
    expect(comment.body).to be_present
  end

  it 'shows the body cant be empty' do
    comment.body = ""
    expect(comment.body).to be_empty
  end
end
