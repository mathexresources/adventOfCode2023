hands = File.readlines('input.test').map{|v| v.split(' ')}
rankHands = [] #{cards, bid, rank, type}
cardValues = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
types = ['high card', 'one pair', 'two pair', 'three of a kind', 'full house', 'four of a kind', 'five of a kind']
hands.each do |hand|
    h = Hash.new(0)
    ranks = ''
    hand[0].each_char do |card|
        h[card[card]] += 1
        ranks += cardValues.find_index(card).to_s
    end
    h.sort_by{|k,v| v}.reverse
    type = 7 if h.values[0] == 5
    type = 6 if h.values[0] == 4
    type = 5 if h.values[0] == 3
    type = 1 if h.values[0] == 1
    type = 4 if h.values[0] == 3 && h.values[1] == 2
    type = 3 if h.values[0] == 2 && h.values[1] == 2
    type = 2 if h.values[0] == 2 && h.values[1] == 1
    p ranks
    rankHands << [hand[0], hand[1].to_i, type, ranks]
end
p rankHands.sort_by{|v| [v[2], v[3]]}
bid = 0

rankHands.sort_by{|v| [v[2], v[3]]}.reverse.each_with_index.map{|v,k| bid += (v[1]*(k+1)); puts "multiplying #{v[1]} by #{k+1}"}
p bid