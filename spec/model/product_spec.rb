require 'rails_helper'

RSpec.describe(Product, type: :model) do
  describe '#true' do
    it 'returns true' do
      product = Product.new

      result = product.true

      expect(result).to eq(true)
    end
  end
end
