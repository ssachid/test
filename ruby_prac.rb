#metaprogramming to the rescue

class Numeric
	
	@@currencies = { 'yen' => 0.013 ,'euro' =>1.292, 'rupee'=>0.019}

	def method_missing(method_id, *args, &block) #capture all args in case have to call super
		singular_currency=method_id.to_s.gsub(/s$/,'')
		if @@currencies.has_key?(singular_currency)
			self* @@currencies[singular_currency]
		else
			super
		end
	end
end

p 2.yen
p 2.euro
p 2.rupees
p 3.pounds





