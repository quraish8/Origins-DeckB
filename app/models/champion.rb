class Champion < ActiveRecord::Base
  attr_accessible :ability, :attack, :aura, :card_number, :disciplines, :energy, :factions, :health, :name, :rarity, :set_id

  # TODO:  This should probably live in a module in lib
  DISCIPLINES = %w(fighter caster summoner)
  FACTIONS = %w(phage)

  %w(factions disciplines).each do |meth|
    define_method(meth) do
       JSON.parse(self.send("#{meth}_json".to_sym))
    end
    define_method("#{meth}=") do |val|
      self.send("#{meth}_json=".to_sym, JSON.generate(val))
    end
  end

  # Helper methods
  DISCIPLINES.each do |discipline|
    define_method("#{discipline}?") do
      disciplines.include? discipline
    end
  end

  FACTIONS.each do |faction|
    define_method("#{faction}?") do
      factions.include? faction
    end
  end
end
