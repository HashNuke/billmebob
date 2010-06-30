class ChangeFieldsInItems < ActiveRecord::Migration
  def self.up
    change_column :items, :name, :text
    change_column :items, :tax, :text
  end

  def self.down
    change_column :items, :name, :string
    change_column :items, :tax, :string
  end
end
