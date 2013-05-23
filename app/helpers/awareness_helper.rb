module AwarenessHelper
  def set_methods(awareness)
    # TODO: This should be in an actual class.  I'm just hella-lazy
    def awareness.is_focal?(spot)
      self[:focal] == spot
    end

    def awareness.is_summoning?(spot)
      self[:summon_spots].include? spot
    end

    def awareness.is_casting?(spot)
      self[:casting_spots].include? spot
    end

    def awareness.is_attacking?(spot)
      self[:attack_spots].include? spot
    end
  end

  def classes_for_square(spot, awareness)
    classes = ['square']
    classes << 'focal' if awareness.is_focal?(spot)
    classes << 'summon' if awareness.is_summoning?(spot)
    classes << 'casting' if awareness.is_casting?(spot)
    classes << 'attack' if awareness.is_attacking?(spot)
    classes
  end

  # Greek Symbols:  http://ancienthistory.about.com/od/greeklanguage/a/ASCIIGreek.htm
  def focal
    "&#916;".html_safe # Delta / Δ
  end

  def casting
    "&#927;".html_safe # Omicron / O
  end

  def attack
    "&#935;".html_safe # Chi / X
  end
end
