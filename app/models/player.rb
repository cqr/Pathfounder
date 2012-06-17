class Player < ActiveRecord::Base
  belongs_to :game
  has_many :base_stats, :autosave => true do
    def [](short_name)
       where(stats:{short_name:short_name}).joins(:stat).first.try :value
    end
    def []=(short_name, value)
      stat = Stat.where(short_name:short_name).first
      base_stat = where(stat_id:stat.id).first
      (base_stat || build.tap{|x| x.stat = stat}).value = value
    end
  end
  attr_accessible :name, :race
  belongs_to :race
  belongs_to :player_class

  def stat(short_name)
    race.bonuses[short_name].inject(base_stats[short_name]){|x,y| x + y}
  end

  def stat_string(short_name)
    sum = race.bonuses[short_name].inject{|a,b| a+b}
    if sum
      sum = (sum > 0 ? "+#{sum}" : sum.to_s )
      "#{base_stats[short_name]}#{sum}"
    else
      base_stats[short_name].to_s
    end
  end

  def inspect
   super.sub(/>$/, ", " + base_stats.map{|x| "#{x.short_name}: #{stat_string(x.short_name)}"}.join(', ') + ">")
  end
end
