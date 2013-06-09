module CharacterNames
  VILLAINS = YAML.load_file("#{Rails.root}/config/game_data/villains.yml")
  HEROES = YAML.load_file("#{Rails.root}/config/game_data/heroes.yml")

  def self.minions_for(villain_name)
    VILLAINS[villain_name]
  end
end
