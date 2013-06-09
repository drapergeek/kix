module FeatureHelpers
  def setup_game
    visit root_path
    click_on 'Start New Game'
  end

  def setup_character(character_options = {})
    click_on 'Set up your hero'
    fill_in_character_information(character_options)
  end

  def setup_game_with_character
    setup_game
    setup_character
  end

  def fill_in_character_information(options = {})
    options = options.reverse_merge(default_character_options)
    fill_in 'Player name', with: options[:player_name]
    fill_in 'Character name', with: options[:character_name]
    fill_in 'Max HP', with: options[:max_hp]
    click_on 'Create Character'
  end

  def default_character_options
    {
      player_name: 'John Doe',
      character_name: 'Fanatic',
      max_hp: 24
    }
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
