class Brand < ApplicationRecord
  has_many :products, dependent: :restrict_with_exception
end
