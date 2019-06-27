require 'rails_helper'

RSpec.describe 'Merchant Delete' do
  describe 'As a visitor' do
    it 'I can delete a merchant' do
      merchant_1 = Merchant.create(name: "Dry Pockets", address: "1008 Royal St George", city: "Naperville", state: "IL", zip: "60654")

      visit "/merchants/#{merchant_1.id}"

      click_button 'Delete'

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content(merchant_1.name)
      expect(page).to_not have_button('Delete')
    end
  end
end
