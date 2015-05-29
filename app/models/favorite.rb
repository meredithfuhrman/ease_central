class Favorite < ActiveRecord::Base
  attr_reader :post_id, :title, :link, :thumbnail, :num_comments

  belongs_to :user
end
