require 'spec_helper'

feature 'game setup' do
  scenario 'user starts a new game' do
    setup_game
    verify_game_started
  end

  scenario 'user resumes an existing game' do
    setup_game
    visit new_game_path
    verify_game_is_already_started
  end

  scenario 'user sends invitations' do
    setup_game
    send_invitations
    verify_invitations_were_sent
  end

  scenario 'user visits invitation link' do
    click_invitation_link
    verify_joined_game
  end
end

def setup_game
  visit root_path
  click_on 'Start New Game'
end

def verify_game_started
  expect(page).to have_content 'Your game has started'
  expect(page).to have_link 'Setup your hero'
end

def verify_game_is_already_started
  verify_game_started
  expect(page).to have_content 'You already have a game started.'
end

def send_invitations
  click_link 'Invite Friends'
  fill_in 'Emails', with: 'spiderman@example.com, wolverine@example.com'
  click_button 'Invite'
end

def verify_invitations_were_sent
  email = deliveries.last
  expect(email.to).to include 'wolverine@example.com'
  expect(email.to).to include 'spiderman@example.com'
  expect(email.body).to include 'http://kix.dev/invitations'
end

 def click_invitation_link
   game = Game.create
   visit invitation_url(game)
 end

 def verify_joined_game
   verify_game_started
   expect(page).to have_content "Thanks for joining the game!"
 end
