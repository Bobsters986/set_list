require 'rails_helper'

RSpec.describe 'Artists creation' do
  # before :each do
  #   @prince = Artist.create!(name: 'Prince')
  #   @purple = @prince.songs.create!(title: "Purple Rain", length: 845, play_count: 8599)
  #   @beret = @prince.songs.create!(title: "Raspberry Beret", length: 665, play_count: 99)
  # end

  it 'links to the new page from the artist index' do
    visit '/artists'

    click_link('New Artist')
    expect(current_path).to eq('/artists/new')
  end

  it 'can create a new artist' do
    visit '/artists/new'

    fill_in('Name', with: 'Prince')
    click_button('Create Artist')

    expect(current_path).to eq("/artists")
    expect(page).to have_content("Prince")
  end

end