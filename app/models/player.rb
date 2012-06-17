class Player < ActiveRecord::Base
  belongs_to :game
  has_many :base_stats, :autosave => true do
    def [](short_name)
       where(stats:{short_name:short_name}).joins(:stat).first.try :value
    end
    def []=(short_name, value)
      stat = Stat.where(short_name:short_name).first
      base_stat = where(stat:stat).first
      (base_stat || build(stat:stat)).value = value
    end
  end
  attr_accessible :name
  belongs_to :race
  belongs_to :player_class

  def inspect
   super.sub(/>$/, ", " + base_stats.map{|x| "#{x.short_name}: #{x.value}"}.join(', ') + ">")
  end
end
