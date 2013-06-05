require 'spec_helper'

feature 'User sets up hero' do
  scenario 'create a new hero' do
    visit new_character_path
    fill_in_character_information
    expect_character_information_to_be_shown
  end
end

def fill_in_character_information
  fill_in 'Player name', with: 'Bob'
  fill_in 'Character name', with: 'Legacy'
  fill_in 'Max HP', with: 25
  click_on 'Create Character'
end

def expect_character_information_to_be_shown
  expect(page).to have_content 'You have successfully created your character.'
  expect(page).to have_content 'Player: Bob'
  expect(page).to have_content 'Character: Legacy'
  expect(page).to have_content 'Max HP: 25'
  expect(page).to have_content 'Current HP: 25'
end
