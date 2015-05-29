class PostsController < ApplicationController
  def index
    response = Net::HTTP.get_response(URI.parse("http://www.reddit.com/top.json"))
    result = JSON.parse(response.body)["data"]["children"]

    @posts = []
    result.each do |post|
      post.each do |key, value|
        if key == "data"
          @posts << {title: value["title"], link: value["permalink"],
          num_comments: value["num_comments"], thumbnail: value["thumbnail"]}
        end
      end
    end
  end

end
