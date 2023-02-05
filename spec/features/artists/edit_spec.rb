require 'rails_helper'

RSpec.describe 'Artists Edit' do
  # before :each do
    # @artist = Artist.create!(name: 'Princ')
  #   @purple = @prince.songs.create!(title: "Purple Rain", length: 845, play_count: 8599)
  #   @beret = @prince.songs.create!(title: "Raspberry Beret", length: 665, play_count: 99)
  # end

  it 'links to the edit page' do
    artist = Artist.create!(name: 'Prince')

    visit '/artists'
    # save_and_open_page
    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can edit the artist' do
    artist = Artist.create!(name: 'Princ')

    visit '/artists'

    expect(page).to have_content('Princ')

    click_button 'Edit Princ'

    fill_in 'Name', with: 'Prince'
    click_button 'Update Artist'

    expect(current_path).to eq('/artists')
    expect(page).to have_content('Prince')
  end
end