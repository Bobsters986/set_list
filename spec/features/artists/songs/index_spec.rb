require 'rails_helper'

# As a user
# When I visit an Artist's Songs index
# Then I see the Titles of all of that Artist's songs
# And I see that each title is a link to the songs show page
RSpec.describe 'Artists songs index' do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: "Purple Rain", length: 845, play_count: 8599)
    @beret = @prince.songs.create!(title: "Raspberry Beret", length: 665, play_count: 99)
  end

  it "shows all of the titles of songs for the artist" do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it "link's to each song's show page" do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")
  end
end
