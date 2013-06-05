require 'spec_helper'

describe Character do
  describe 'current_hp' do
    it 'it is set to the max hp on create' do
      character = Character.new(max_hp: 10)
      character.save
      expect(character.current_hp).to eq(10)
    end

    it 'cannot exceed the max hp' do
      character = Character.create(max_hp: 10)
      character.current_hp = 11
      expect(character).not_to be_valid
      expect(character.errors[:current_hp]).to include('cannot exceed max hp')
    end
  end
end
