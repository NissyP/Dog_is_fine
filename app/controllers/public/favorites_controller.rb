class Public::FavoritesController < ApplicationController
  belongs_to :user
  belongs_to :blog
end
