def print_out_diffs(sheet1, sheet2)

 #Get the "keys" that return the correct hash values from the results array
 key1 = sheet1.result_array[0]
 key2 = sheet2.result_array[0]

 #For each sheet, this is how individual target values (in the present
 #case, IP addresses, can be found:

 #print sheet1.result_array[1][key1]    Returns: "10.14.160.78"
 #print  sheet2.result_array[n][key2]   Returns:  the IP in the n^th row



 #Pull in all the values for the target key into an array for comparison.

 #The first array element is the key, so start at 1 not 0.  The other
 #elements in the array are hashes, so use the first element (the key)
 #to pull the appropriate value out of them.
 n =1
 size_sheet1 = sheet1.result_array.size
 comp_array1 = []

 while n < size_sheet1


   unless sheet1.result_array[n][key1] == nil

     comp_array1  << sheet1.result_array[n][key1]
   end

   n += 1

 end

 #(hopefully temporarily) violate DRY for expediency.

 m = 1
 size_sheet2 = sheet2.result_array.size
 comp_array2 = []

 while m < size_sheet2


   unless sheet2.result_array[m][key2] == nil

     comp_array2  << sheet2.result_array[m][key2]
   end

   m += 1

 end

 #Why not return the number of matches at run time? it will aid in
 #debugging at first.
 match_number = 0


 #Therefore, the output can be formated as an array of arrays, each
 #member being a row in the output CSV file.  We will be storing three:

 #IP addresses that are in both:
 union_array = []

 #IP addresses that are in ONE but not TWO
 diff_1_2 = []

 #IP addresses that are in TWO but not ONE
 diff_2_1 = []

 #The first line in each array is the header.  The columns in the union
 #array are based on the first sheet
 union_array[0] = sheet1.header_array
 diff_1_2[0]    = sheet1.header_array
 diff_2_1[0]    = sheet2.header_array


 union_line = []

 #diff_2_1_line = []


 comp_array1.each_with_index do |val, idx|

 diff_1_2_line = []


   #Some runtime output which may get tossed in final version
   puts comp_array2.include?(val).to_s + " " + val + " ID: " + idx.to_s


   if comp_array2.include?(val)
     match_number += 1

   else
     sheet1.header_array.each_with_index do |h_val, i|
       diff_1_2_line[i] = sheet1.result_array[idx.+ 1][h_val]
     end  

     diff_1_2[idx + 1] =  diff_1_2_line  
    end



  end   #end comp_array1.each


  writer = CSV.open('./results/' + \
                    sheet1.working_file + \
                    "__diff__" +\
                    sheet2.working_file, 'w')
  diff_1_2.each do |line|
    unless line == nil #Don't print blank lines.
     writer << line
    end
  end
  writer.close






  puts "Number of entries from first, in second: " +  match_number.to_s

end #def print_out_diffs(sheet1, sheet2)
