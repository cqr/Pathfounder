module Bonusable
  def self.included(klass)
    klass.has_many :bonuses, :as => :source, :class_name => 'Bonus' do
      def for_stat(stat)
        stat = Stat.where(:short_name => stat).first unless stat.kind_of?(Stat)
        target.where(:stat => stat)
      end
    end
  end

  # Maybe add more methods here...


end
