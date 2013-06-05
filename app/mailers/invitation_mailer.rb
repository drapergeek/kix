class InvitationMailer < ActionMailer::Base
  default from: "sentinelsgame@kixitherokuapp.com"

  def invitation(emails, game)
    @game = game

    mail(to: emails,
         subject: "You've been invited to a game of Sentinels of the Multiverse!")
  end

end
