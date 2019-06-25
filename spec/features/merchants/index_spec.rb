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
