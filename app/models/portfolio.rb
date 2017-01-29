class Portfolio < ApplicationRecord
	validates_uniqueness_of :name
	has_many :transactions
end
