class DealCards
  def initialize
     build_url random_card
  end

  def to_s
    "#{build_url random_card}"
  end

  def build_url(c)
     base_url = "https://pacific-sands-78456.herokuapp.com/card/images/"
     puts base_url << random_card << ".png"
     base_url << random_card << ".png"
  end

  def random_card
     suits = ["D","C","H","S"]
     rank = [2,3,5,5,6,7,8,9,10,"J","K","Q","A"]
     "#{rank[rand(rank.size)]}" << "#{suits[rand(suits.size)]}"	
  end
end
