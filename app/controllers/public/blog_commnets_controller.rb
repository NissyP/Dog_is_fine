class Public::BlogCommnetsController < ApplicationController
  belongs_to :user
  belongs_to :blog
end
