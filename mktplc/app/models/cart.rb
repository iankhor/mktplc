class Cart < ApplicationRecord
  belongs_to :user
  has_many :item_to_carts
  has_many :items, through: :item_to_carts
end
