class AddDetailsToInvoice < ActiveRecord::Migration
  def self.up
    add_column :invoices, :discount_type, :string, {:default=>"%"}
    add_column :invoices, :discount, :decimal, {:default=>0}
    add_column :invoices, :due_by, :date
    add_column :invoices, :issued_on, :date
  end

  def self.down
    remove_column :invoices, :issued_on
    remove_column :invoices, :due_by
    remove_column :invoices, :discount
    remove_column :invoices, :discount_type
  end
end
