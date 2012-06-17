class BaseStat < ActiveRecord::Base
  belongs_to :stat
  belongs_to :player
  attr_accessible :value, :stat
end
