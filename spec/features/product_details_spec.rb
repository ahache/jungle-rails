require 'rails_helper'

RSpec.feature "Visitor is taken to product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They click a product link on the home page" do
    visit root_path
    click_link 'Details'
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end

end
