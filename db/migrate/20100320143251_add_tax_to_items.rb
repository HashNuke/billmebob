class AddTaxToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :tax, :string
  end

  def self.down
    remove_column :items, :tax
  end
end
