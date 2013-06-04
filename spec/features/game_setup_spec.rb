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
end

def setup_game
  visit root_path
  click_on 'Start New Game'
end

def verify_game_started
  expect(page).to have_content 'Your game has started'
  expect(page).to have_selector('a', text: 'Setup your hero')
end

def verify_game_is_already_started
  verify_game_started
  expect(page).to have_content 'You already have a game started.'

end
