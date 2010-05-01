class AddExpiresOnToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :expires_on, :datetime
    add_index "products", ["expires_on"], :name => "index_products_on_expires_on"
  end

  def self.down
    remove_column :products, :expires_on
  end
end
