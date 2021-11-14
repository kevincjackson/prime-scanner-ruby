# Cache Pattern
# get(x,cache)
#   cache.get(b,x)
#		if b & b,x
# 	      	return b,x
# 	  	else
#			loaded = load(b)
#			if loaded
#				return b, x 
#			else
#				calc(b)
#				save(b)
#				return b,x
#			end
# 		end
	