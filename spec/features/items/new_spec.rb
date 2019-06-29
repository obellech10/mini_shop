require 'rails_helper'

RSpec.describe 'New Merchant Item' do
  describe 'As a visitor' do
    describe 'When I visit the new merchant item form' do
      it 'I can create a new item for that merchant' do
        merchant = Merchant.create!(name: "Mountain Trader", address: "1008 Royal St George", city: "Naperville", state: "IL", zip: "60654")
        item = Item.create!(name: "Phone baggie",
                            description: "Store phone when hiking",
                            price: 9.99,
                            image: "pic of baggie",
                            status: "active",
                            inventory: 30,
                            merchant_id: merchant.id)

        visit "/merchants/#{merchant.id}/items"

        click_link 'New Item'

        expect(current_path).to eq("/merchants/#{merchant.id}/items/new")

        fill_in 'Name', with: 'Head Lamp'
        fill_in 'Price', with: 14.99
        fill_in 'Description', with: 'Use in the dark'
        fill_in 'Image', with: 'pic of head lamp'
        fill_in 'Inventory', with: 40
        click_on 'Create Item'

        expect(current_path).to eq("/merchants/#{merchant.id}/items")
        expect(page).to have_content('Head Lamp')
      end
    end
  end
end
