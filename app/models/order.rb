class Order < ApplicationRecord
  belongs_to :shop
  has_many :line_items, dependent: :destroy
end
