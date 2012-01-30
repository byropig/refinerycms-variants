class FieldAddedToVariant < ActiveRecord::Migration
  def self.up
		add_column :variants, :product_id, :integer
  end

  def self.down
		remove_column :variants, :product_id
  end
end
