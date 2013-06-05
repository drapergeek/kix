class InvitationsController < ApplicationController
  def new
  end

  def create
    send_invitations
    redirect_to current_game, notice: 'Invited!'
  end

  def show
    find_and_set_current_game
    redirect_to current_game, notice: 'Thanks for joining the game!'
  end

  private

  def send_invitations
    InvitationMailer.invitation(emails, current_game).deliver
  end

  def emails
    params[:emails].split(/[\s,]+/).compact
  end

  def find_and_set_current_game
    game = Game.find_by_id(params[:id])
    set_current_game(game)
  end
end
