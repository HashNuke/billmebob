class AddCurrencyToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :currency, :string
  end

  def self.down
    remove_column :invoices, :currency
  end
end
