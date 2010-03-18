class Invoice < ActiveRecord::Base
  has_many :items, :dependent=>:destroy
  accepts_nested_attributes_for :items
end
