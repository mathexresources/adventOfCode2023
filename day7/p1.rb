hands = File.readlines('input').map{|v| v.split(' ')}
rankHands = [] #{cards, bid, rank, type}
cardValues = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
types = ['high card', 'one pair', 'two pair', 'three of a kind', 'full house', 'four of a kind', 'five of a kind']
hands.each do |hand|
    h = Hash.new(0)
    hand[0].each_char do |card|
        h[card[card]] += 1
    end
    h = h.sort_by {|k,v| v}.reverse
    type = 7 if h[0][1] == 5 # five of a kind
    type = 6 if h[0][1] == 4 # four of a kind
    type = 5 if h[0][1] == 3 && h[1][1] == 2 # full house
    type = 1 if h[0][1] == 1 && h[1][1] == 1 && h[2][1] == 1 && h[3][1] == 1 && h[4][1] == 1 # high card
    type = 4 if h[0][1] == 3 && h[1][1] == 1 # three of a kind
    type = 3 if h[0][1] == 2 && h[1][1] == 2 # two pair
    type = 2 if h[0][1] == 2 && h[1][1] == 1 # one pair
    p hand if type.nil?
    rankHands << [hand[0], hand[1].to_i, type]
end

rankHands = rankHands.sort_by{|v| v[2]}
rankHands.each_with_index do |v,k|
    next if k == 0
    if v[2] == rankHands[k-1][2]
        char = 0
        while v[0][char] == rankHands[k-1][0][char]
            char += 1
        end
        if cardValues.find_index(v[0][char]) < cardValues.find_index(rankHands[k-1][0][char])
            tmp = rankHands[k-1]
            rankHands[k-1] = v
            rankHands[k] = tmp
        end
    end
end

bid = 0
rankHands.each_with_index.map {|v,k| bid += v[1] * (k+1)}
p bid