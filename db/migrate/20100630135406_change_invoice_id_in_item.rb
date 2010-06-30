class ChangeInvoiceIdInItem < ActiveRecord::Migration
  def self.up
    change_column :items, :invoice_id, :integer
  end

  def self.down
    change_column :items, :invoice_id, :string
  end
end
