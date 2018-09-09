class DealCards
  def initialize
     build_url random_card
  end

  def to_s
    "#{build_url random_card}"
  end

  def rand_card_name(c)
    rand_card = { "QS": "n0GggnF.png","QH": "rLc6Pwh.png", "QC": "2Ke1YiB.png", "KC": "TySiTWs.png",
		  "KD": "SRY5O27.png", "JS": "tevTqXi.png", "QD": "U8kewmZ.png", "JH": "jF0Tnl2.png",
		  "KH": "cLm76Ic.png", "JD": "SJs98sG.png", "JC": "J8znBPZ.png", "KS": "l2c10XN.png",
		  "4H": "h27IfGo.png", "8S": "IO68V2v.png", "9S": "YZuuLNp.png", "8D": "8k5787R.png",
		  "8C": "7UcjwTw.png", "6S": "cjaB79U.png", "10S": "KXyQCfL.png", "7C": "jz6YHwl.png",
		  "5S": "o7Xrp5v.png", "7H": "pgsRQn7.png", "AS": "KIWJnqx.png", "9H": "9wH95Hb.png",
		  "5H": "6FTdrLA.png", "5C": "F1upC6P.png", "10H": "nEXBTLm.png", "6H": "l2vjxT4.png",
		  "8H": "BHB9BaL.png", "9D": "xnvY1m7.png", "7S": "zd4PtOo.png", "3D": "89tX6Nt.png",
		  "2S": "hnZSzoq.png", "AC": "zt8baI9.png", "3S": "0Z4yMke.png", "6C": "eazglCB.png",
		  "AD": "QbumPsa.png", "6D": "BR7fC5j.png", "4C": "q4K7hFA.png", "4S": "4sD43yh.png",
		  "AH": "fsoxIN0.png", "3C": "FIIhle8.png", "2H": "zqsF33K.png", "2D": "a7UvaUn.png",
		  "4D": "GvsZTvE.png", "5D": "T9R7Itw.png", "10C": "SOd31v9.png", "7D": "tCgiGR1.png",
		  "10D": "bUfogMX.png", "9C": "bUfogMX.png", "3H": "crsTCQ0.png", "2C": "8ftXL42.png"}
    rand_card(c.to_sym)
  end		   
    

  def build_url(random_card)
     base_url = "https://i.imgur.com/"
     base_url << rand_card_name(random_card)
  end

  def random_card
     suits = ["D","C","H","S"]
     rank = [2,3,5,5,6,7,8,9,10,"J","K","Q","A"]
     "#{rank[rand(rank.size)]}" << "#{suits[rand(suits.size)]}"	
  end
end
