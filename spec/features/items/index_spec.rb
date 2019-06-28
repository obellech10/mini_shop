require 'rails_helper'

RSpec.describe 'Items index' do
  describe 'As a visitor' do
    it 'I can see all the items' do
      merchant_1 = Merchant.create!(name: "Dry Pockets", address: "1008 Royal St George", city: "Naperville", state: "IL", zip: "60654")
      merchant_2 = Merchant.create!(name: "Mountain Trader", address: "1008 Royal St George", city: "Naperville", state: "IL", zip: "60654")
      item_1 = Item.create!(name: "Phone baggie",
                          description: "Store phone when hiking",
                          price: 9.99,
                          image: "pic of baggie",
                          status: "active",
                          inventory: 30,
                          merchant_id: merchant_1.id)
      item_2 = merchant_2.items.create!(name: "Hammock",
                          description: "you lay down in it",
                          price: 24.99,
                          image: "pic of hammock",
                          status: "active",
                          inventory: 50)

      visit '/items'


        expect(page).to have_content(item_1.name)
        expect(page).to have_content(item_2.name)
    end
  end
end
