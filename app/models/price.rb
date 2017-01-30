class Price < ApplicationRecord
  belongs_to :coin
  validates_uniqueness_of :query_time

end
