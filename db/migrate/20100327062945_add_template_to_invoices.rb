class AddTemplateToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :template, :string, {:default=>"both"}
  end

  def self.down
    remove_column :invoices, :template
  end
end
