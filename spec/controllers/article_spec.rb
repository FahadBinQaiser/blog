require 'rails_helper'
describe ArticlesController do
  let(:article) { Article.new(title: "Hello Pookie", body: "Pookie!") }

  it 'has a title' do
    expect(article.title).to eq("Hello Pookie")
  end

  it 'has a body' do
    expect(article.body).to eq("Pookie!")
  end

  it 'shows the title cant be empty' do
    article.title = ""
    expect(article.title).to be_empty
  end

  it 'shows the body cant be empty' do
    article.body = ""
    expect(article.body).to be_empty
  end
end
