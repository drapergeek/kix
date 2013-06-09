require 'spec_helper'

feature 'user manages hero' do
  scenario 'create a new hero' do
    setup_game
    click_on 'Set up your hero'
    fill_in_character_information legacy_character
    verify_character_information_is_shown
  end

  scenario 'user modifies hp' do
    setup_game
    setup_character max_hp: 25
    lower_hp
    verify_hp_is_lowered_by_one
    increase_hp
    verify_hp_is_increased_by_one
  end

  scenario 'user cannot increase hp past maximum' do
    setup_game
    setup_character max_hp: 25
    increase_hp
    verify_hp_did_not_exceed_max
  end
end

def legacy_character
  {
    player_name: 'Bob',
    character_name: 'Legacy',
    max_hp: 25
  }
end

def verify_character_information_is_shown
  expect(page).to have_content 'You have successfully created your character.'
  expect(page).to have_selector('h2', text: 'Legacy')
  expect(page).to have_content 'Max: 25'
  expect(page).to have_current_hp(25)
end

def lower_hp
  click_on '-'
end

def increase_hp
  click_on '+'
end

def verify_hp_is_lowered_by_one
  expect(page).to have_current_hp(24)
end

def verify_hp_is_increased_by_one
  expect(page).to have_current_hp(25)
end

def verify_hp_did_not_exceed_max
  expect(page).to have_current_hp(25)
end

def have_current_hp(amount)
  have_content "Current #{amount}"
end
