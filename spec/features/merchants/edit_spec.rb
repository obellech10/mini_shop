require 'rails_helper'

RSpec.describe 'Merchant Update' do
  describe 'As a visitor' do
    describe 'When I visit merchant show page' do
      it 'I can update the merchant' do
        merchant_1 = Merchant.create(name: "Kitchens r Us", address: "1008 Royal St George", city: "Naperville", state: "IL", zip: "60654")

        visit "/merchants/#{merchant_1.id}"

        click_link 'Edit'

        expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

        fill_in 'Name', with: "Kitchen Center"
        fill_in 'Address', with: "2436 1st Ave"
        fill_in 'City', with: "Seattle"
        fill_in 'State', with: "WA"
        fill_in 'Zip', with: "23461"
        click_on 'Update Merchant'

        expect(current_path).to eq("/merchants/#{merchant_1.id}")
        expect(page).to have_content('Kitchen Center')
      end
    end
  end
end
