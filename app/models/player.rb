class Player < ActiveRecord::Base
  belongs_to :game
  has_many :base_stats do
    def [](short_name)
       where(stats:{short_name:short_name}).joins(:stat).first.try :value
    end
    def []=(short_name, value)
      Player.transaction do
        self[short_name].try :destroy
        create stat:Stat.where(short_name:short_name).first, value: value
      end
    end
  end
  attr_accessible :name

end
