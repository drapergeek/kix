class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_character

  protected

  def set_current_game(game)
    session[:game_id] = game.id
  end

  def current_game
    @game ||= Game.find_by_id(session[:game_id])
  end

  def current_character
    @current_character ||= Character.find_by_id(session[:current_character])
  end

  def set_current_character(character)
    session[:current_character] = character.id
  end
end
