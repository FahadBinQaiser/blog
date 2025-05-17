require 'rails_helper'

describe CommentsController do
  let(:comment) { Comment.new(body: "Pookie is learning!") }

  it 'has a body' do
    expect(comment.body).to eq("Pookie is learning!")
  end

  it 'shows the body cant be empty' do
    comment.body = ""
    expect(comment.body).to be_empty
  end
end
