class GamesController < ApplicationController
  def new
    if current_character_or_game
      redirect_to current_character_or_game
    end
  end

  def create
    game = Game.create
    set_current_game(game)
    redirect_to game
  end

  def show

  end

  private

  def current_character_or_game
    current_character || current_game
  end
end
