module SuperModulo
	def inventario(arr)
		suma = arr.inject{|sum, x| sum += x }
	end
end

module SuperModuloInst
	def iva
		precio * 0.19
	end
end

class Abuelo
	extend SuperModulo
	include SuperModuloInst
	def foo
		puts "Soy el abuelo"		
	end
end

class Padre < Abuelo
	
end

class Hija < Padre
	attr_accessor :stock, :precio
	def initialize(precio = 1000,stock = 20)
		@precio = precio
		@stock = stock
	end
end

p1 = Hija.new
p2 = Hija.new(10000,5)

puts p1.iva
puts p2.iva
puts Hija.inventario([p1.stock, p2.stock])