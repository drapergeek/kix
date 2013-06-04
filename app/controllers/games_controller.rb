class GamesController < ApplicationController
  def new
    if current_game
      flash[:notice] = 'You already have a game started.'
      redirect_to current_game
    end
  end

  def create
    game = Game.create
    set_current_game(game)
    redirect_to game
  end

  def show

  end
end
