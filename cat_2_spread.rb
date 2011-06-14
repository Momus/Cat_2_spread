#!/usr/bin/env ruby


# A program to combine two spreadsheets, each containing a column of
# IP addresses, and combining them into one, each containing only one
# instance of each IP address.

# (c) 2011 Dmitri G. Brengauz for International Business Machines.

# This software is released on the same terms as its components:
# Ruby License.

load "./input_sheet.rb"


#Initially, let's stick to working with just two sheets at a
#time.

#test command line to make sure we have them:

if  ARGV[1] == nil
  puts "Remember to supply TWO files"
  exit
end

#See Input Sheet class def. for object specifications.
# TODO: Write object specs for Input Sheet class.
sheet1 =   Input_Sheet.new(ARGV[0])

pp sheet1

sheet2 =   Input_Sheet.new(ARGV[1])


pp sheet2

#Get the "keys" that return the correct hash values from the results array
key1 = sheet1.result_array[0]
key2 = sheet2.result_array[0]

#For each sheet, this is how individual target values (in the present
#case, IP addresses, can be found:

#print sheet1.result_array[1][key1]    Returns: "10.14.160.78"
#print  sheet2.result_array[1][key2]   Returns: "129.39.231.134"



#Pull in all the values of the key into an array for comparison.

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

comp_array1.each do |val|
  puts comp_array2.include?(val).to_s + " " + val
end

pp  "ONE" , comp_array1
pp "TWO" , comp_array2


# comp_array1.each_with_index do |val , idx|
#   if comp_array2.include?(val)
#     p "It's here"
#     pp val
#     pp comp_array1.index(val)
#     pp comp_array2.index(val)
#   else
#     p "It's not"
#     pp val
#     pp comp_array1.index(val)
#     pp comp_array2.index(val)
   
#   end
# end
