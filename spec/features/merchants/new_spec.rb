require 'rails_helper'

RSpec.describe 'New Merchant' do
  describe 'As a visitor' do
    describe 'When I visit the new merchant form' do
      it 'I can create a new merchant' do
        visit '/merchants'

        click_link 'New Merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in 'Name', with: 'Barbs Books'
        fill_in 'Address', with: '1432 Main St'
        fill_in 'City', with: 'Portland'
        fill_in 'State', with: 'OR'
        fill_in 'Zip', with: '98382'
        click_on 'Create Merchant'

        expect(current_path).to eq("/merchants")
        expect(page).to have_content('Barbs Books')
      end
    end
  end
end
