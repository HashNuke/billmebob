class Item < ActiveRecord::Base
  belongs_to :invoice
  validates_numericality_of :quantity
end
