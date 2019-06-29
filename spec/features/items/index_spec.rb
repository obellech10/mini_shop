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
                          description: "you lay in it",
                          price: 24.99,
                          image: "pic of hammock",
                          status: "active",
                          inventory: 50)

      visit '/items'


      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_2.name)
    end
  end

  describe 'Merchant Items show page' do
    describe 'As a visitor' do
      it 'I can see items that belong to that merchant' do
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
                            description: "you lay in it",
                            price: 24.99,
                            image: "pic of hammock",
                            status: "active",
                            inventory: 50)

        visit "/merchants/#{merchant_1.id}/items"

        expect(page).to have_content(item_1.name)
        expect(page).to have_content(item_1.price)
        expect(page).to have_content(item_1.image)
        expect(page).to have_content(item_1.status)
        expect(page).to have_content(item_1.inventory)

        visit "/merchants/#{merchant_2.id}/items"

        expect(page).to have_content(item_2.name)
        expect(page).to have_content(item_2.price)
        expect(page).to have_content(item_2.image)
        expect(page).to have_content(item_2.status)
        expect(page).to have_content(item_2.inventory)
      end
    end
  end

  describe 'Item Show Page' do
    describe 'As a Visitor' do
      it 'I see the item with that id including the items
          - name
          - status
          - price
          - description
          - image
          - inventory
          - merchants name that sells item' do

        merchant = Merchant.create!(name: "Dry Pockets", address: "1008 Royal St George", city: "Naperville", state: "IL", zip: "60654")
        item = Item.create!(name: "Phone baggie",
                            description: "Store phone when hiking",
                            price: 9.99,
                            image: "pic of baggie",
                            status: "active",
                            inventory: 30,
                            merchant_id: merchant.id)

        visit "/items/#{item.id}"

        expect(page).to have_content(item.name)
        expect(page).to have_content(item.status)
        expect(page).to have_content(item.price)
        expect(page).to have_content(item.description)
        expect(page).to have_content(item.image)
        expect(page).to have_content(item.inventory)
        expect(page).to have_content(merchant.name)
      end
    end
  end

  describe 'Item Update' do
    describe 'As a visitor' do
      describe 'When I visit a Item show page' do
        it 'I can update the item' do

          merchant = Merchant.create!(name: "Dry Pockets", address: "1008 Royal St George", city: "Naperville", state: "IL", zip: "60654")
          item = Item.create!(name: "Phone Baggie",
                              description: "Store phone when hiking",
                              price: 9.99,
                              image: "pic of baggie",
                              status: "active",
                              inventory: 30,
                              merchant_id: merchant.id)

          visit "/items/#{item.id}"

          click_link 'Edit'

          expect(current_path).to eq("/items/#{item.id}/edit")

          fill_in 'Name', with: "Phone Sleeve"
          fill_in 'Description', with: "Keep phone dry during hikes"
          click_on 'Update Item'

          expect(current_path).to eq("/items/#{item.id}")
          expect(page).to have_content('Phone Sleeve')
          expect(page).to have_content('Keep phone dry during hikes')
        end
      end
    end
  end
end
