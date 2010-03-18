class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.string :by_company
      t.string :by_address
      t.string :to_company
      t.string :to_address

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
