class Game < ActiveRecord::Base
  has_many :stats
  has_many :races
  has_many :players
  attr_accessible :name
end
