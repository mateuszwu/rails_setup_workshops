class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def true
    true
  end
end
