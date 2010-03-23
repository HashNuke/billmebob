class AddTaxTitleToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :tax_title, :string
  end

  def self.down
    remove_column :invoices, :tax_title
  end
end
