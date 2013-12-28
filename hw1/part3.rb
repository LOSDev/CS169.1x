def combine_anagrams(words)
	anagrams_hash = Hash.new { |hash, k| hash[k] = [] }
  	words.each do |word|
    	word_ordered = word.downcase.scan(/\w/).sort.join
    	anagrams_hash[word_ordered] << word
  	end
  	anagrams_group = []
  	anagrams_hash.sort.each do |k, v|
  		anagrams_group << anagrams_hash[k]
  	end
  	anagrams_group
end
