require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { create(:article) }

  it 'is valid with valid attributes' do
    expect(article).to be_valid
  end

  it 'has a title' do
    expect(article.title).to eq("Hello Pookie")
  end

  it 'has a body' do
    expect(article.body).to be_present
  end

  it 'is invalid without a title' do
    article.title = ""
    expect(article).to_not be_valid
  end

  it 'is invalid without a body' do
    article.body = ""
    expect(article).to_not be_valid
  end
end
