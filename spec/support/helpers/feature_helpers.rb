module FeatureHelpers
  def setup_game
    visit root_path
    click_on 'Start New Game'
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
