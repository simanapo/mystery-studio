class MysteryListsController < ApplicationController

  def index
    @basic_count = Post.all.where(challenge_level: 1).count
    @medium_count = Post.all.where(challenge_level: 2).count
    @advance_count = Post.all.where(challenge_level: 3).count
  end

end