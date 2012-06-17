class Bonus < ActiveRecord::Base
  belongs_to :stat
  belongs_to :source, :polymorphic => true
  attr_accessible :stat_modifier, :stat
end
