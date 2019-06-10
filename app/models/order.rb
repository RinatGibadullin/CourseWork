class Order < ApplicationRecord
	has_many :ordered_products
end
