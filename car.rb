# create class where you can set price and doors
# module Camry
# 	def Camry(input)
# 		if input == Camry
# 			raise "This car costs $20000. And it has 4 doors"
# 		end
# 	end
# end

# module Porshe
# 	def Porshe(input)
# 		if input == Porshe
# 			raise "This car costs $80000. And it has 2 doors"
# 		end
# 	end
# end
require 'pry'
require 'csv'


#binding.pry

class Car

	attr_reader :price, :doors, :color, :name

	def initialize(n, p, d, c)
		@price = p
		@doors = d
		@color = c
		@name = n
	end

	def information
		puts "A " + name + " costs $" + price.to_s + ", has " + doors.to_s + " doors, and is " + color.to_s
	end

	def color
		@color || "white"
	end
end

# class Camry < Car

# 	def name
# 		"Camry"
# 	end
# end

# class Mercedes < Car

# 	def name
# 		"Mercedes"
# 	end
# end

# class Porsche < Car

# 	def name
# 		"Porsche"
# 	end
# end

# class Maserati < Car

# 	def name
# 		"Maserati"
# 	end
# end

# class Ferrari < Car

# 	def name
# 		"Ferrari"
# 	end
# end

# class Lamborghini < Car

# 	def name
# 		"Lamborghini"
# 	end
# end



banana = Car.new("Echo", 20000, 4, "white")
# camry = Camry.new(25000, 4, "blue")
# mercedes = Mercedes.new(50000, 2, "red")
# porsche = Porsche.new(80000, 4, "silver")
# maserati = Maserati.new(110000, 2, "yellow")
# ferrari = Ferrari.new(150000, 2, "orange")
# ferrari_limited = Ferrari.new(300000, 2, "red")
# lamborghini = Lamborghini.new(400000, 2, "brown")

# [camry, mercedes].each do |i|
# 	#Something happens here
# 	puts i.color
# end


class Dealership

	attr_reader :name, :cars, :car_inventory#, :camry, :mercedes, :porsche, :maserati, :ferrari


	def initialize(dealership_name)# cars, camry, mercedes, porsche, maserati, ferrari)
		@name = dealership_name
		#@car_inventory = car_inventory
		@cars = []#@car_inventory
		CSV.foreach(ARGV[0]) do |row|
			# read name from row
			n = row[0]
			# read price from row
			p = row[1]
			# read color from row
			c = row[2]

			# create an instance of car
			car = Car.new(n, p, 4, c)

			# add car to our list of cars
			add_cars [car]
		end
	end

	def add_cars(cars_array)
		@cars += cars_array
	end

	def listings
		@cars.each do |c|
			puts c.information
		end
	end

	def total_lot_value
		total_sum = 0
		@cars.each do |c|
			total_sum = total_sum + c.price.to_i
		end
		total_sum
	end

end

dealership = Dealership.new("Niki's Dealership")
dealership.listings
puts "Total lot value: " + dealership.total_lot_value.to_s




