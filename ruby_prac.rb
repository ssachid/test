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

# @@currencies is a hash which just maps currency names to conversion factors				
# One of the facilities of Ruby is that method missing gets called when you call a method on 
# the receiver and the receiver doesn't know any method by that name, but if you have defined a method
# called method_missing in your class, it will receive the call instead. Method_missing is passed 
# upto 3 arguments. The first one is the actual name
# of the method you tried to call, but which doesn't appear to
# exist, a list of the arguments that that method would have
# received if it existed, and optionally a block. Most Ruby methods are
# written so that they can take a block as an argument, 
# What method missing does in our case is, it looks at the method
# ID, converts it to a string, gets rid of any final s ...
# remember we had the problem of wanting to be able to call 1.
# Euro as well as 1. Euros ... so we're basically going to
# canonicalize the name of a currency to its singular, and then we
# just ask whether we already have a key for that currency and we
# convert it. 





