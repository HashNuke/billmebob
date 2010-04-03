class Invoice < ActiveRecord::Base
  has_many :items, :dependent=>:destroy
  accepts_nested_attributes_for :items, :reject_if => lambda{ |a| a[:name].blank? }, :allow_destroy=>true

  validates_presence_of :by_company, :message=> "Your company name"
  validates_presence_of :by_address, :message=> "Your company's address"
  validates_presence_of :to_company, :message=> "Client name"
  validates_presence_of :to_address, :message=> "Client's address"

end
