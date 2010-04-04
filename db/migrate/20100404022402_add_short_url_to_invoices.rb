class AddShortUrlToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :shorturl, :string
  end

  def self.down
    remove_column :invoices, :shorturl
  end
end
