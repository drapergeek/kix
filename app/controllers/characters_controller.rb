class CharactersController < ApplicationController
  respond_to :html

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      flash[:notice] = 'You have successfully created your character.'
    end

    respond_with @character
  end

  def show
    @character = Character.find_by_id(params[:id])
  end

  private

  def character_params
    params.
      require(:character).
      permit(:player_name, :character_name, :max_hp)
  end
end
