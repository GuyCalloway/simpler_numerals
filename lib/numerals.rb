def numeralize(integer)
    numerals = ""
    arr = [["I", "V"], ["X", "L"], ["C", "D"], ["M", "(V)"], ["(X)", "(L)"], ["(C)", "(D)"], ["(M)"]] 
    numArray = integer.to_s.split("")
    l = numArray.length
    y = []
    numArray.each_with_index {|x, i| z = l - i
          y <<  [x, z-1] }
 
    y.each {|x| if x[0] == "0"
                elsif ["1", "2", "3"].include? x[0]
                    numerals << arr[x[1]][0] * x[0].to_i
              elsif x[0] == "4"
                    numerals <<  arr[x[1]][0] + arr[x[1]][1]
              elsif x[0] == "9"
                numerals <<  arr[x[1]][0] + arr[x[1]+1][0]
              else
                z = x[0].to_i - 5
                numerals << arr[x[1]][1] + arr[x[1]][0] * z
    end  }
    return numerals
 end