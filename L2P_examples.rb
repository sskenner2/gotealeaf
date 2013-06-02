#ch 10



# 10.5 A Few More Things to Try
# Expanded english_number.

def english_number number
  if number < 0 # no neg #'s
		return 'pls enter a # that is not negative'
	end
	if number == 0
		return 'zero'
	end

	# no special cases .. no returns
	num_string = '' # we will return this string
	ones_place = ['one', 'two', 'three',
				'four', 'five', 'six',
				'seven', 'eight', 'nine']
	tens_place = ['ten', 'twenty', 'thirty',
				'forty', 'fifty', 'sixty',
				'seventy', 'eighty', 'ninety']
	teenagers = ['eleven', 'twelve', 'thirteen',
				'fourteen', 'fifteen', 'sixteen',
				'seventeen', 'eighteen', 'nineteen']
	zillions = [['hundred', 2],
				['thousand', 3],
				['million', 6],
				['billion', 9],
				['trillion', 12],
				['quadrillion', 15],
				['quintillion', 18],
				['sextillion', 21],
				['septillion', 24],
				['octillion', 27],
				['nonillion', 30],
				['decillion', 33],
				['undecillion', 36],
				['duodecillion', 39],
				['tredecillion', 42],
				['quattuordecillion', 45],
				['quindecillion', 48],
				['sexdecillion', 51],
				['septendecillion', 54],
				['octodecillion', 57],
				['novemdecillion', 60],
				['vigintillion', 63],
				['googol', 100]]	

	# 'left' = how much of the num still hv left to write out
	# 'write' = the part we are writing out right now
	left = number

	while zillions.length > 0
		zil_pair = zillions.pop
		zil_name = zil_pair[0]
		zil_base = 10 ** zil_pair[1]
		write = left/zil_base  # how many zillions left?
		left = left - write * zil_base  # subtract off zillions

		if write > 0 
			# .. the recursion:
			prefix = english_number write
			num_string = num_string + prefix + ' ' + zil_name

			if left > 0
				# to correct if 'two billionfifty-one' ..
				num_string = num_string + ' '
			end
		end
	end

	write = left/10  # how many tens left
	left = left - write * 10  # subtract off tens

	if write > 0 
		if ((write == 1) and (left > 0))
			# special exception to prevent 'tenty-two'
			num_string = num_string + teenagers[left-1]
			# '-1' bc teenagers[3] is 'fourteen'
			# digit in ones place sorted .. nothing left to write
			left = 0
		else
			num_string = num_string + tens_place[write-1]
			# '-1' bc tens_place[3] is 'forty'
		end

		if left > 0
			# to prevent write 'sixtyfour'
			num_string = num_string + '-'
		end
	end

	write = left  # how many ones left to write out?
	left = 0  # subtract off those ones

	if write > 0 
		num_string = num_string + ones_place[write-1]
		# '-1' bc ones_place[3] is four not ..
	end

	num_string
end

# “Ninety-nine Bottles of Beer on the Wall.”
# .. would ..

num_at_start = 5 

num_bot = proc { |n| "#{english_number n} bottle#{n == 1 ? '' : 's'}" }

num_at_start.downto(2) do |num|
	bottles = 
	puts "#{num_bot[num]} of beer on the wall, #{num_bot[num]} of beer!".capitalize
	puts "take one down, pass it around, #{num_bot[num-1]} of beer on the wall!"
end
puts "#{num_bot[1]} of beer on the wall, #{num_bot[1]} of beer!".capitalize
puts "take one down, pass it around, no more bottles of beer on the wall!"

# .. could ..
=begin
num_at_start = 5  # try 9999 ..
num_now = num_at_start
while num_now > 2
	puts english_number(num_now).capitalize + ' bottles of beer on the wall, ' + english_number(num_now) + ' bottles of beer!'
	num_now = num_now - 1
	puts 'take one down, pass it around, ' +
	english_number(num_now) + ' bottles of beer on the wall!'
end

puts "two bottles of beer on the wall, two bottles of beer!"
puts "take one down, pass it around, one bottle of beer on the wall!"
puts "one bottle of beer on the wall, one bottle of beer!"
puts "tke one down, pass it around, no more bottles of beer on the wall!"

=begin
puts english_number(0)
puts english_number(9)
puts english_number(10)
puts english_number(17)
puts english_number(32)
puts english_number(85)
puts english_number(99)
puts english_number(100)
puts english_number(234)
puts english_number(3211)
puts english_number(99999999)
puts english_number(100099999)
#puts english_number(1000999998927348692376298375928370892309842038749237492)



# dictionary sort
# .. could ..

=begin
def dictionary_sort arr   ## this is a wrapper method ..
	rec_dict_sort arr, [] ## when trying to sort an array, 
end						  ## this passes in an empty array
						  ## for the second array parameter
def rec_dict_sort unsorted, sorted
	if unsorted.length <= 0
		return sorted
	end
	# if here then there is still work to do

	smallest = unsorted.pop
	still_unsorted = []

	unsorted.each do |tested_object|
		if tested_object.downcase < smallest.downcase
			# when tested_object < smallest
			still_unsorted.push smallest
			smallest = tested_object
		else
			still_unsorted.push tested_object
		end
	end
	# now 'smallest' really does point to the smallest
	# element that 'unsorted' contained, and all the 
	# rest of it is in 'still_unsorted'
	sorted.push smallest

	rec_dict_sort still_unsorted, sorted
end

#puts(dictionary_sort(['can','feel','singing','like','A','can']))
puts(dictionary_sort(['cat','big','A']))




# shuffle
# .. would do it

=begin

def shuffle arr
	arr.sort_by{rand}
end

p(shuffle([1,2,3,4,5,6,7,8,9]))

# .. could do it

=begin

def shuffle arr
	shuf = []
	# returned array
	while arr.length > 0
		# randomly pick one element of the array
		rand_index = rand(arr.length)
		# rand_index = 4
		# now go thru ea item in the array, putting them
		# all into new_arr except for the randomly chosen
		# one, which goes into shuf

		curr_index = 0
		# tracks current index
		new_arr = []
		# ?????

		arr.each do |item|
			if curr_index == rand_index
				# 0 == 4 -> no
				# when 4 == 4 
				shuf.push item
				# shuf = [5]
			else
				new_arr.push item
				# new_array = [1,2,3,4]
			end

			curr_index = curr_index + 1
			# curr_index = 1 .. 4
		end

		# replace the original array with the new, smaller
		# array

		arr = new_arr
		# arr = [1,2,3,4]
	end

	shuf
end

puts(shuffle([1,2,3]))
#puts(shuffle([1,2,3,4,5,6,7,8,9]))


=begin

# Rite of Passage: Sorting

# how i would do it

def sort arr
	return arr if arr.length <= 1

	middle = arr.pop
	less = arr.select{|x| x <  middle}
	more = arr.select{|x| x >= middle}

	sort(less) + [middle] + sort(more)
end

p(sort(['can', 'feel', 'singing', 'like', 'a', 'can']))


# How u could do it:

def sort arr
	rec_sort arr, []
end

def rec_sort unsorted, sorted
	if unsorted.length <= 0
		return sorted
	end

	# if get to here then more work to do

	smallest = unsorted.pop

	still_unsorted = []

	unsorted.each do |tested_object|
		if tested_object < smallest
			still_unsorted.push smallest
			smallest = tested_object
		else
			still_unsorted.push tested_object
		end
	end
	# now "smallest" really points to the smallest element
	# that "unsorted" contained, and the rest of it is in 
	# "still_unsorted"

	sorted.push smallest

	rec_sort still_unsorted, sorted
end

puts(sort(['can', 'feel', 'singing', 'like', 'a', 'can']))


# ch 9

####### WHY IS THIS WRONG IN BOTH TXT AND BELOW???#######
# “Modern” Roman Numerals
# How I would do it:

def roman_numeral num 
	raise 'must use + integer' if num <= 0
	
	digit_vals =   [['I',	   5,	   1],
					['V',	  10,	   5],
					['X',	  50,	  10],
					['L',	 100,	  50],
					['C',	 500,	 100],
					['D',	1000,	 500],
					['M',	 nil,	1000]]
	roman = ''
	remaining = nil

	# build string "roman" in reverse.
	build_rev = proc do |l,m,n|
		num_l = m ? (num % m / n) : (num / n)
		full = m && (num_l == (m/n - 1))

		if full && (num_l>1 || remaining)
			# must carry
			ramaining ||= l #carry l if not already carrying
		else
			if remaining
				roman << l + remaining
				remaining = nil
			end

			roman << l * num_l
		end
	end

	digit_vals.each{|l,m,n| build_rev[l,m,n]}

	roman.reverse
end
	
puts (roman_numeral(1999))


# “Modern” Roman Numerals
# How you could do it:

def roman_numeral num 
	
	thous = (num 		/ 1000)
	# 1599/1000 -> 1.599 <floor> 1
	hunds = (num % 1000 /  100)
		# % -> 599/100 -> 5.99 <floor> 5
	tens  = (num % 100 	/   10)
		# % -> 99/10 -> 9.9 <floor> 9
	ones  = (num % 10  )
		# % -> 9 
	
	roman = 'M' * thous
		# 'M' * 1 -> M
	if hunds == 9
		roman = roman + 'CM'
	elsif hunds == 4
		roman = roman + 'CD'
	else
		roman = roman + 'D' * (num % 1000 / 500)
			# 'M'+'D'*[(599/500) -> 1.198<floor>] -> 'MD'
		roman = roman + 'C' * (num %  500 / 100)
			# 'MD'+'C'*[(99/100) -> 0.99<floor>] -> 'MD'
	end

	if tens == 9
		roman = roman + 'XC'
			# 'MDXC'
	elsif tens == 4
		roman = roman + 'XL'
	else
		roman = roman + 'L' * (num % 100 / 50)
		roman = roman + 'X' * (num %  50 / 10)
	end

	if ones == 9
		roman = roman + 'IX'
			# 'MDXCIX'
	elsif ones == 4
		roman = roman + 'IV'
	else
		roman = roman + 'V' * (num % 10 / 5)
		roman = roman + 'I' * (num %  5 / 1)
	end

	roman
end

puts(roman_numeral(1999))
	# MCMXCIX
puts(roman_numeral(1599))
	# MDXCIX 


# Old-School Roman Numerals
# How I would do it:
def old_roman_numeral num 
	raise 'must use + integer' if num <= 0
	roman = ''

	roman << 'M' * (num / 1000)
		# -> 1.925 -> 1 (floor)
	roman << 'D' * (num % 1000 / 500)
		# -> 925/500 -> 1.85 -> 1 (floor)
	roman << 'C' * (num % 500 / 100)
		# -> 425/100 -> 4.25 -> 4 (floor)
	roman << 'L' * (num % 100 / 50)
		# -> 25/50 -> 0.5 -> 0 (floor)
	roman << 'X' * (num % 50 / 10)
		# -> 25/10 -> 2.5 -> 2 (floor)
	roman << 'V' * (num % 10 / 5)
		# -> 5/5 -> 1 -> 1 
	roman << 'I' * (num % 5 / 1)
		# -> 0/10 -> 0 -> 0

	roman
end
puts(old_roman_numeral(1925))


# before ch 9

# roman numerals
def roman_numeral num 
	
	thous = (num 			/ 1000)
	hunds = (num 	% 1000 	/  100)
	tens  = (num 	% 100 	/   10)
	ones  = (num 	% 			10)

	roman = 'M' * thous
	
end

puts 'number please:'
num = gets.chomp.to_i

puts old_roman_numeral(num)

# questionairre

puts 'info about the questionaire..'

while true 
	puts 'do u like eating tacos'
	answer = gets.chomp.downcase
	if (answer == 'yes' || answer == 'no')
		break
	else
		puts 'please answer yes or no'
	end
end

while true
	puts 'do u like eating burritos'
	answer = gets.chomp.downcase
	if (answer  == 'yes' || answer == 'no')
		break
	else
		puts 'please answer yes or no'
	end
end

while true
	puts 'do u wet the bed'
	answer = gets.chomp.downcase
	if (answer == 'yes' || answer == 'no')
		if answer == 'yes'
			wets_bed = true
		else
			wets_bed = false
		end
		break
	else
		puts 'please answer yes or no'
	end
end

while true
	puts 'do u like eating chimis'
	answer = gets.chomp.downcase
	if (answer == 'yes' || answer == 'no')
		break
	else
		puts 'please answer yes or no'
	end

	puts 'just a few more questions...'

	while true 
		puts 'do u like eating sopap'
		answer = gets.chomp.downcase
		if(answer == 'yes' || answer == 'no')
			break
		else
			puts 'please answer yes or no'
		end
	end
end

puts
puts 'debriefing .. thank you'
puts
puts wets_bed


=end



