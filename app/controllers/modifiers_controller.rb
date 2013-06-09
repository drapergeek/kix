class ModifiersController < ApplicationController
  respond_to :html

  def new
    @modifier = Modifier.new
  end

  def create
    modifier = Modifier.create(modifier_params)
    modifier.character =  current_character
    modifier.save

    respond_with modifier, location: modifier.character
  end

  def destroy
    modifier = Modifier.find(params[:id]).destroy
    respond_with modifier, location: character_path(current_character)
  end


  private

  def modifier_params
    params.require(:modifier).permit(:name)
  end
end
