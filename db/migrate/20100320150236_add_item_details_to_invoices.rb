class AddItemDetailsToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :item_title, :string
    add_column :invoices, :quantity_title, :string
    add_column :invoices, :cost_title, :string
  end

  def self.down
    remove_column :invoices, :cost_title
    remove_column :invoices, :quantity_title
    remove_column :invoices, :item_title
  end
end
