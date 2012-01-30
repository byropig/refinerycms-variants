class Variant < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :stock_code]

  validates :name, :presence => true
  
  belongs_to :image
  belongs_to :product
  has_many :line_items
  
  delegate :url, :to => :image, :prefix => true
  
  def name_and_price    
    name + " - R" + price.to_i.to_s
  end
end
