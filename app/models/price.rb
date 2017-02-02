class Price < ApplicationRecord
  belongs_to :coin
  validates :query_time, :presence => true, :uniqueness => {:scope => :coin_id}

end
