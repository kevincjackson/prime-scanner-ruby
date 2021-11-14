require '../prime-compressor-ruby/prime_compressor.rb'

def scan(nth_billion)  								
	# Init
	puts "Initializing..." # DEBUG
	buf = "0101010101" * 10**8 * nth_billion 		# 10**8
	buf[1] = "0"									#special case
	buf[2] = "1"									#special case
	bufsize = buf.size 								# 4B 
	sqrt = Math.sqrt(nth_billion * bufsize).to_i 	# 63245 so low!

	# Calc
	puts "Crossing off multiples..." # DEBUG
	3.upto(sqrt) do |i| # good

		# Skip multiples
		if buf[i] == "0"
			next
		end

		# Leave the current, that's prime
		multiple = i + i

		print "#{i} " # DEBUG
		while multiple < bufsize 
			# if in range cross it off
			buf[multiple] = "0"
			multiple += i;
		end
	end

	buf
end


nth = 4
# xs = "0101000101" * 10**8 * nth
xs = scan(nth)
0.upto(nth - 1) do |n|
	billion = 10**9
	a = n * billion
	b = a + billion
	fileout = "primes_#{n}B.bin"
	PrimeCompressor.zip(xs[a...b], fileout)
end
