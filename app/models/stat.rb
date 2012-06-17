class Stat < ActiveRecord::Base
  belongs_to :game
  attr_accessible :name, :short_name
end
