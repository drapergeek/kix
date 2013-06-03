require 'spec_helper'

feature 'smoke test' do
  it 'loads the home page' do
    visit root_path
    page.should have_content 'Welcome home!'
  end
end
