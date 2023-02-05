require 'rails_helper'

RSpec.describe 'Detroying an Artist' do
  # before :each do
  #   @prince = Artist.create!(name: 'Prince')
  #   @purple = @prince.songs.create!(title: "Purple Rain", length: 845, play_count: 8599)
  #   @beret = @prince.songs.create!(title: "Raspberry Beret", length: 665, play_count: 99)
  # end

  it 'can delete the artist from the index page' do
    artist = Artist.create!(name: 'Prince')

    visit '/artists'
    click_button 'Delete'
    
    expect(current_path).to eq('/artists')
    expect(page).to_not have_content('Prince')
  end
end