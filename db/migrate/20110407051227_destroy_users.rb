class DestroyUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
  end

  def self.down
  end
end
