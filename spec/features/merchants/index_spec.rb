require 'rails_helper'

RSpec.describe "Merchants index" do
  describe "As a visitor" do
    it "I see the name of each merchant in the system" do
      merchant_1 = Merchant.create(name: "Kitchens r Us")
      merchant_2 = Merchant.create(name: "Wayne's Sports World")

      visit "/merchants"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
  end
end



# RSpec.describe "Songs Index" do
#   describe "As a visitor" do
#     it "I see all songs and their title and playcount" do
#       song_1 = Song.create(title: "Hit me baby one more time", length: 345, playcount: 1000)
#       song_2 = Song.create(title: "What is love", length: 543, playcount: 2)
#
#       visit "/songs"
#
#
#
#       expect(page).to have_content(song_1.title)
#       expect(page).to have_content("Playcount: #{song_1.playcount}")
#       expect(page).to have_content(song_2.title)
#       expect(page).to have_content("Playcount: #{song_2.playcount}")
#     end
#   end
# end
