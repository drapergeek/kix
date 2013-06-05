class HpChangesController < ApplicationController
  respond_to :html

  def create
    character.modify_hp(lower_hp?)

    respond_with character do |format|
      unless character.save
        flash[:notice] = 'You cannot exceed the max hp.'
      end

      format.html { redirect_to character }
    end
  end

  private

  def lower_hp?
    params[:type] != '+'
  end

  def character
    @character ||= Character.find_by_id(params[:character_id])
  end
end
