class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.create(favorite_params)
    @favorite.user_id = current_user.id
  end

  def destroy
  end
end
