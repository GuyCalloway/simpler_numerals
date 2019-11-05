def numeralize(integer)
    numerals = ""
    roman_numerals = [["I", "V"], ["X", "L"], ["C", "D"], ["M", "(V)"], ["(X)", "(L)"], ["(C)", "(D)"], ["(M)"]] 
    number_array = integer.to_s.split("")
    length = number_array.length
    num_array_with_position = []

    number_array.each_with_index do |number, i| 
        position = length - (i + 1)
        num_array_with_position <<  [number, position] 
    end
 
    num_array_with_position.each do |x|
      if x[0] == "0"
      elsif ["1", "2", "3"].include? x[0]
        numerals << roman_numerals[x[1]][0] * x[0].to_i
      elsif x[0] == "4"
        numerals <<  roman_numerals[x[1]][0] + roman_numerals[x[1]][1]
      elsif x[0] == "9"
        numerals <<  roman_numerals[x[1]][0] + roman_numerals[x[1]+1][0]
      else
        surplus = x[0].to_i - 5
        numerals << roman_numerals[x[1]][1] + roman_numerals[x[1]][0] * surplus
      end  
    end
    return numerals

 end