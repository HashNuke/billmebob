class ChangeFieldsInInvoice < ActiveRecord::Migration
  def self.up
    change_column :invoices, :by_company, :text
    change_column :invoices, :by_address, :text
    change_column :invoices, :to_company, :text
    change_column :invoices, :to_address, :text
    change_column :invoices, :item_title, :text
    change_column :invoices, :quantity_title, :text
    change_column :invoices, :cost_title, :text
    change_column :invoices, :tax_title, :text
    change_column :invoices, :template, :text
    change_column :invoices, :discount_type, :text
    change_column :invoices, :shorturl, :text
    change_column :invoices, :currency, :text
  end

  def self.down
    change_column :invoices, :by_company, :string
    change_column :invoices, :by_address, :string
    change_column :invoices, :to_company, :string
    change_column :invoices, :to_address, :string
    change_column :invoices, :item_title, :string
    change_column :invoices, :quantity_title, :string
    change_column :invoices, :cost_title, :string
    change_column :invoices, :tax_title, :string
    change_column :invoices, :template, :string
    change_column :invoices, :discount_type, :string
    change_column :invoices, :shorturl, :string
    change_column :invoices, :currency, :string
  end
end
