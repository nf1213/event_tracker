class Event < ActiveRecord::Base
  validates_presence_of :location
end
