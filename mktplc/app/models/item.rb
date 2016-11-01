class Item < ApplicationRecord
  belongs_to :user
  has_many :item_to_carts
  has_many :carts, through: :item_to_carts
end
