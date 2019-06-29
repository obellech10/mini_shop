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

  describe "As a visitor" do
    it "I see the merchant with that id including the merchants:
        -name
        - address
        - city
        - state
        - zip" do
      merchant_1 = Merchant.create(name: "Kitchens r Us", address: "1008 Royal St George", city: "Naperville", state: "IL", zip: "60654")
      merchant_2 = Merchant.create(name: "Wayne's Sports World", address: "2893 Federal", city: "Tucson", state: "AZ", zip: "47923")

      visit "/merchants/#{merchant_1.id}"

      expect(page).to have_content(merchant_1.id)
      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_1.address)
      expect(page).to have_content(merchant_1.city)
      expect(page).to have_content(merchant_1.state)
      expect(page).to have_content(merchant_1.zip)
    end
  end

  describe 'Links to Merchants Show page' do
    describe 'As a visitor' do
      describe 'When I click on merchant name' do
        it 'takes me to the merchant show page' do

          merchant_1 = Merchant.create(name: "Kitchens r Us", address: "1008 Royal St George", city: "Naperville", state: "IL", zip: "60654")
          item = Item.create!(name: "Phone Baggie",
                              description: "Store phone when hiking",
                              price: 9.99,
                              image: "pic of baggie",
                              status: "active",
                              inventory: 30,
                              merchant_id: merchant_1.id)

          visit '/merchants'
          click_link 'Kitchens r Us'
          expect(current_path).to eq("/merchants/#{merchant_1.id}")

          visit "/items/#{item.id}"
          click_link 'Kitchens r Us'
          expect(current_path).to eq("/merchants/#{merchant_1.id}")

          visit "/merchants/#{merchant_1.id}/items"
          click_link 'Kitchens r Us'
          expect(current_path).to eq("/merchants/#{merchant_1.id}")
        end
      end
    end
  end

end
