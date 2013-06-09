class ModifierInformation
  TYPES = YAML.load_file("#{Rails.root}/config/modifiers.yml")
end
