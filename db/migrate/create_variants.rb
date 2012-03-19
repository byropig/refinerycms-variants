class CreateVariants < ActiveRecord::Migration

  def self.up
    create_table :variants do |t|
      t.string :name
      t.integer :image_id
      t.decimal :price
      t.string :stock_code
      t.integer :position

      t.timestamps
    end

    add_index :variants, :id

    load(Rails.root.join('db', 'seeds', 'variants.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "variants"})
    end

    #if defined?(Page)
    #  Page.delete_all({:link_url => "/variants"})
    #end

    drop_table :variants
  end

end
