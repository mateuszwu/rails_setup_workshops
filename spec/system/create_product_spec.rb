require 'rails_helper'

RSpec.describe('Create product', type: :system) do
  it 'creates a new product' do
    Product.create(name: 'makbuk')
    visit('/products/new')

    fill_in('Name', with: 'makbuk')
    click_button('Create Product')

    # expect(page).to have_content('Products')
  end
end
