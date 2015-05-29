class PostsController < ApplicationController
  def index
    response = HTTParty.get("http://www.reddit.com/top.json")
    result = JSON.parse(response.body)["data"]["children"]

    @posts = []
    result.each do |post|
      post.each do |key, value|
        if key == "data"
          @posts << {id: value["id"], title: value["title"], link: "http://www.reddit.com#{value["permalink"]}",
          num_comments: value["num_comments"], thumbnail: value["thumbnail"]}
        end
      end
    end
  end

end
