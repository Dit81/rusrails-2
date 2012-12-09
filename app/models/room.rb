class Room < ActiveRecord::Base
  attr_accessible :address, :city, :pic, :price, :rooms, :text, :tittle

  #validates :price #:numericality { :greater_than = 0 }
end
