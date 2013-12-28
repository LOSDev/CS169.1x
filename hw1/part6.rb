class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      nil
    end
  end
  
end

class String
  def palindrome?
    only_letters = gsub(/\W/, '').downcase
    only_letters == only_letters.reverse
  end
end

module Enumerable
	def palindrome?
    	return false if self.class == Hash
    	self.to_a == self.to_a.reverse
  	end
end
