class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.create(favorite_params)
    @favorite.user_id = current_user.id
    if @favorite.save
      flash[:notice] = "Favorite added."
      redirect_to posts_path
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  protected
  def favorite_params
    params.permit(:post_id, :title, :link, :thumbnail, :num_comments, :user_id)
  end

end
