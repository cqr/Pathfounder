class MakeSomeDataAboutPathfinder < ActiveRecord::Migration
  def up
    game = Game.new(name: "Pathfinder")
    game.save

    %w(Strength Constitution Wisdom Intelligence Charisma Dexterity).each do |n|
      game.stats.create(name:n, short_name: n[0,3].downcase)
    end

    race = game.races.create name: "Elf"

    race.bonuses.create stat_modifier: 2, stat: game.stats.where(short_name: 'cha').first
    race.bonuses.create stat_modifier: -2, stat: game.stats.where(short_name: 'con').first

    player = game.players.build(name:"Timmy", race: race)

    %w(str con wis int cha dex).each do |sn|
      player.base_stats[sn] = rand(6)
    end

    player.save

    say "We just made " + player.inspect

  end

  def down
  end
end
