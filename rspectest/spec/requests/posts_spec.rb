require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "Get the first post - GET /posts/1" do
    it 'gets the first post' do
      first_post = Post.create!(title: "First Post", content: "Content")
      get post_path(first_post)
      expect(response).to have_http_status(200) #success
      expect(response).not_to have_http_status(404)
    end
  end
end
