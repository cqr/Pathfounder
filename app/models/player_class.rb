class PlayerClass < ActiveRecord::Base
  include Bonusable
  belongs_to :game
  attr_accessible :name
end
