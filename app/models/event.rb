class Event
  include Mongoid::Document
  attr_accessible :name, :description
  
  field :name, type: String
  field :description, type: String
  embedded_in :user
  
 validates :user, :presence => true
 validates :name, :presence => true
end
