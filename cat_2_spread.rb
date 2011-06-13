#!/usr/bin/env ruby


# A program to combine two spreadsheets, each containing a column of
# IP addresses, and combining them into one, each containing only one
# instance of each IP address.

# (c) 2011 Dmitri G. Brengauz for International Business Machines.

# This software is released on the same terms as its components:
# Ruby License.

load "./input_sheet.rb"


#Intially, let's stick to working with just two sheets at a
#time.

#test command line to make sure we have them:

if  ARGV[1] == nil
  puts "Remeber to supply TWO files"
  break
end


sheet1 =   Input_Sheet.new(ARGV[0])



sheet2 =   Input_Sheet.new(ARGV[1])




#Get the "keys" that return the correct hash values from the results array
key1 = sheet1.result_array[0]
key2 = sheet2.result_array[0]


#pp "keyed result",sheet1.result_array[1][key1] ,
#sheet2.result_array[1][key2]


comp_array1 = []

#The first line is the header, so we start at 1 not 0
n =1
size_sheet1 = sheet1.result_array.size

while n < size_sheet1
  
  
  unless sheet1.result_array[n][key1] == nil
    
    comp_array1  << sheet1.result_array[n][key1]
  end

  n += 1

end

#(hopefully temporarily) violate DRY for simplisity.

m = 1
size_sheet2 = sheet2.result_array.size
comp_array2 = []

while m < size_sheet2
  
  
  unless sheet2.result_array[m][key2] == nil
    
    comp_array2  << sheet1.result_array[m][key2]
  end
  
  m += 1
  
end


pp  "ONE" , comp_array1.inspect 
pp "TWO" , comp_array2.inspect
