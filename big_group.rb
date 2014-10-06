file = File.open("apple_stock.csv", "a+")
d = file.readlines

i = 0
while i < d.length
        d[i] = d[i].split(",")
        i+=1
end

i = 1
sum = 0
while i < d.length
        sum = d[i][1].tr('"','').to_f + sum
        i+=1
end

mean = sum / (d.length)

i = 1
sumation = 0
while i < d.length
	sumation = (d[i][1].tr('"','').to_f - mean)**2 + sumation
	i+=1
end

sd = Math.sqrt(sumation/(d.length - 1))

f = File.open("stats.txt","w")

i = 1
while i < d.length
	f.write(d[i][0].tr('"','').to_s + "     " + d[i][1].tr('"','').to_s + "     " + sd.to_s + "     " + ((d[i][1].tr('"','').to_f-mean)/sd).to_s + "\n") 
	i+=1
end

f.close
file.close
