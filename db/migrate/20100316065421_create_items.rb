class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :invoice_id
      t.string :name
      t.integer :quantity
      t.decimal :cost, {:default=>0.00, :precision=>10, :scale=>2}

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
