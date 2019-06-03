class MysteryListsController < ApplicationController

  def index
    @basics = Post.all.where(challenge_level: 1)
    @mediums = Post.all.where(challenge_level: 2)
    @advances = Post.all.where(challenge_level: 3)
    @basic_count = Post.all.where(challenge_level: 1).count
    @medium_count = Post.all.where(challenge_level: 2).count
    @advance_count = Post.all.where(challenge_level: 3).count
  end

end