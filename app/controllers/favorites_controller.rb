class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.create(favorite_params)
    @favorite.user_id = current_user.id
    if @favorite.save
      redirect_to posts_path
    end
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to favorites_path
  end

  protected
  def favorite_params
    params.permit(:post_id, :title, :link, :thumbnail, :num_comments, :user_id)
  end

end
