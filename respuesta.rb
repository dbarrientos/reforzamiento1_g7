def leer_archivo(archivo)
	file = File.open(archivo, "r")
	lines = file.readlines()
	file.close()
	return lines
end

def inasistencias(archivo)
	lines = leer_archivo(archivo)
	a = []
	lines.each do |line|
		linea = line.chomp.split(", ")
		suma = 0
		linea.each do |dato|
			if dato != linea[0] and dato == "A"
				suma += 1
			end	
		end
		if suma > 0
			a << "#{linea[0]} faltó #{suma} vez o veces\n"
		end
	end
	return a	
end


def gen_file(archivo)
	lines = leer_archivo(archivo)
	lines.each do |line|
		linea = line.chomp.split(", ")
		suma = 0
		linea.each do |dato|
			if dato != linea[0]
				dato = dato.to_i
				suma += dato
			end	
		end
		promedio = suma.to_f / (linea.length - 1) 
		File.open("#{linea[0]}.txt","w"){|x| x.puts "#{linea[0]} tiene un promedio de #{promedio}"}
	end
	return "Archivos generados"	
end

def aprobados(archivo, nota_aprobacion)
	lines = leer_archivo(archivo)
	
	lines.each do |line|
		linea = line.chomp.split(", ")
		suma = 0
		linea.each do |dato|
			if dato != linea[0]
				dato = dato.to_i
				suma += dato
			end	
		end
		promedio = suma.to_f / (linea.length - 1)
		if promedio > nota_aprobacion
			puts "#{linea[0]} con nota #{promedio}"
		end
	end
end


interruptor = 0
while interruptor == 0
	puts "Ingrese una de las opciones"
	puts "1 - Generar archivos con promedios"
	puts "2 - Inasistencias totales"
	puts "3 - Alumnos aprobados"
	puts "4 - Salir"
	opc = gets.chomp.to_i

	case opc
	when 1
		puts gen_file("notas.csv")
	when 2
		puts inasistencias("notas.csv")
	when 3
		puts "Ingrese nota de aprobacion (entre 1 y 10)"
		nota = gets.chomp.to_f
		if nota == 0
			nota = 5.0
		end
		aprobados("notas.csv", nota)
		puts " "
	when 4
		interruptor = 1
		puts "Hasta la vista baby!!!"
		exit
	else
		puts "La opción ingresada no es correcta"
	end	
end