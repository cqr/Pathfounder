module Bonusable
  def self.included(klass)
    klass.has_many :bonuses, :as => :source, :class_name => 'Bonus' do
      def [](stat)
        stat = Stat.where(:short_name => stat, game_id: proxy_association.owner.game_id).first unless stat.kind_of?(Stat)
        where(:stat_id => stat.id).map(&:stat_modifier)
      end
    end
  end

  # Maybe add more methods here...


end
