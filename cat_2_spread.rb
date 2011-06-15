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



 spread_sheet2 =   Input_Sheet.new(ARGV[1])


 print_out_diffs(spread_sheet1, spread_sheet2)

 print_out_diffs(spread_sheet2, spread_sheet1)



