require 'spec_helper'

feature 'user manages hero' do
  scenario 'create a new hero' do
    setup_game
    click_on 'Set up your hero'
    fill_in_character_information
    verify_character_information_is_shown
  end

  scenario 'user modifies hp' do
    setup_game
    setup_character
    lower_hp
    verify_hp_is_lowered_by_one
    increase_hp
    verify_hp_is_increased_by_one
  end

  scenario 'user cannot increase hp past maximum' do
    setup_game
    setup_character
    increase_hp
    verify_hp_did_not_exceed_max
  end
end

def fill_in_character_information
  fill_in 'Player name', with: 'Bob'
  fill_in 'Character name', with: 'Legacy'
  fill_in 'Max HP', with: 25
  click_on 'Create Character'
end

def verify_character_information_is_shown
  expect(page).to have_content 'You have successfully created your character.'
  expect(page).to have_content 'Player: Bob'
  expect(page).to have_content 'Character: Legacy'
  expect(page).to have_content 'Max HP: 25'
  expect(page).to have_content 'Current HP: 25'
end

def setup_character
  click_on 'Set up your hero'
  fill_in_character_information
end

def lower_hp
  click_on '-'
end

def increase_hp
  click_on '+'
end

def verify_hp_is_lowered_by_one
  expect(page).to have_content 'Current HP: 24'
end

def verify_hp_is_increased_by_one
  expect(page).to have_content 'Current HP: 25'
end

def verify_hp_did_not_exceed_max
  expect(page).to have_content 'Current HP: 25'
end
