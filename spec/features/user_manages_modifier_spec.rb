require 'spec_helper'

feature 'user manages modifiers' do
  scenario 'user adds a modifier to their character and removes it' do
    setup_game_with_character
    add_modifier
    verify_modifier_is_active
    remove_modifier
    verify_modifier_is_removed
  end
end

def add_modifier
  click_on 'Add Modifier'
  select '-1 Damage Taken', from: 'Modifier Type'
  click_on 'Add'
end

def remove_modifier
  within '.modifier' do
    click_on 'x'
  end
end

def verify_modifier_is_removed
  expect(page).not_to have_modifier
end

def verify_modifier_is_active
  expect(page).to have_modifier
end

def have_modifier
  have_selector('.modifier', text: '-1 Damage Taken')
end
