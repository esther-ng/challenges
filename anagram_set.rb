def anagram_set(arr)
  anagrams = {}
  arr.each do |word| # O(n)
    word_hash = {}
    word.each_char do |letter|
      if word_hash[letter]
        word_hash[letter] += 1
      else
        word_hash[letter] = 1
      end
    end
    if anagrams[word_hash]
      anagrams[word_hash] += 1
    else
      anagrams[word_hash] = 1
    end
  end
  anagrams.max_by {|k,v| v}[1]
end
