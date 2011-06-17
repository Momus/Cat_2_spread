 #!/usr/bin/env ruby


 # A program to combine two spreadsheets, each containing a column of
 # IP addresses, and combining them into one, each containing only one
 # instance of each IP address.

 # (c) 2011 Dmitri G. Brengauz for International Business Machines.

 # This software is released on the same terms as its components:
 # Ruby License.

 load "./input_sheet.rb"
 load "./print_out_diffs.rb"

 #Initially, let's stick to working with just two sheets at a
 #time.

 #test command line to make sure we have them:

 if  ARGV[1] == nil
   puts "Remember to supply TWO files"
   exit
 end

 #See Input Sheet class def. for object specifications.
 # TODO: Write object specs for Input Sheet class.
 spread_sheet1 =   Input_Sheet.new(ARGV[0])



<<<<<<< HEAD
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


   #end comp_array1.each
 end

 #pp diff_1_2

 #=begin
 writer = CSV.open('./results/diff_1-2.csv', 'w')
pp "writing output"
 diff_1_2.each do |line|
   unless line == nil #Don't print blank lines.
     writer << line
   end
 end
 writer.close
 #=end
=======
 spread_sheet2 =   Input_Sheet.new(ARGV[1])
>>>>>>> functionalize


 print_out_diffs(spread_sheet1, spread_sheet2)

 print_out_diffs(spread_sheet2, spread_sheet1)



