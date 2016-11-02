require 'rails_helper'

RSpec.describe Post, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'orders by title' do
    first = Post.create!(title: 'The first post.', content: 'It is the first post of many')
    second = Post.create!(title: 'The second post.', content: 'It is the second post of many')
    
    expect(Post.order(:title)).to eq([first, second])
  end
end
