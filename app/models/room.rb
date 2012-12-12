class Room < ActiveRecord::Base
  attr_accessible :address, :city, :pic, :price, :rooms, :text, :tittle

 # validates :title, :presence => :true,
  #                  :length => { :minimum => 5}


  validates :price, :numericality => { :greater_than => 0 }
  validates :price, :address, :city, :rooms, :tittle, :pic, :presence => true
end
