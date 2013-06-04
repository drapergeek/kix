class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def set_current_game(game)
    session[:game_id] = game.id
  end

  def current_game
    Game.find_by_id(session[:game_id])
  end
end
