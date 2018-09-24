class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
end
