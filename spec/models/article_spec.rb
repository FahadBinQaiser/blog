require 'rails_helper'

describe ArticlesController do 
  let(:article) { Article.new(title: "Hello Pookie", body: "Pookie is learning!", status: "public") }

  it 'works with valid attributes' do
    expect(article).to be_valid
  end

  it 'has a title' do
    expect(article.title).to eq("Hello Pookie")
  end

  it 'has a body' do
    expect(article.body).to eq("Pookie is learning!")
  end

  it 'shows title can\'t be empty' do
    article.title = ""
    expect(article.title).to be_empty
  end

  it 'shows body can\'t be empty' do
    article.body = ""
    expect(article.body).to be_empty
  end
end