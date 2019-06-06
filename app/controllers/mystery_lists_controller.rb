class MysteryListsController < ApplicationController

  # 謎解き問題一覧(難易度別)
  def index
    @basics = Post.all.where(challenge_level: ::Post.challenge_levels[:basic])
    @mediums = Post.all.where(challenge_level: ::Post.challenge_levels[:medium])
    @advances = Post.all.where(challenge_level: ::Post.challenge_levels[:advance])
    @basic_count = Post.all.where(challenge_level: ::Post.challenge_levels[:basic]).count
    @medium_count = Post.all.where(challenge_level: ::Post.challenge_levels[:medium]).count
    @advance_count = Post.all.where(challenge_level: ::Post.challenge_levels[:advance]).count
  end

end