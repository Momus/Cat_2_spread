#!/usr/bin/env ruby


# A program to combine two spreadsheets, each containing a column of
# IP addresses, and combining them into one, each containing only one
# instance of each IP address.

# (c) 2011 Dmitri G. Brengauz for International Business Machines.

# This software is released on the same terms as its components:
# Ruby License.

require 'csv'



# Pretty print objects for a better debugging experience
# Declaration should probably be removed in final version
require 'pp'

class Input_Sheet

  attr_accessor :result_array


def initialize(file_csv)

  # Input: CSV file 

  # Output: array of arrays.  first element of array contains the
  # index key, the other elements contain hashes corresponding to each
  # row.




  @result_array = Array.new
  row_hash = Hash.new

  target_column_index = nil  #Becomes int at runtime


#Each row is a hash column: cell value
#Sheet will be an array of hashes

  reader = CSV.open(file_csv , 'r') 


  #In the inital version, the sheet will be keyed by IP; the regexp
  #below should caputre only those.

  key_target = /[0-2]?[0-9]?[0-9]\.[0-2]?[0-9]?[0-9].[0-2]?[0-9]?[0-9]\.[0-2]?[0-9]?[0-9]/




  #Read the first line, if it conatins no key_target, then it is a
  #header lile, save it as :header If it does contain an instance of
  #key_target, then the file does not contain a header, and its keys
  #are constructed by column number.

  #Get first row
  first_row = reader.shift
  #And the second
  second_row = reader.shift

  #Find out if fist row contains the  key_target

  has_header = true
  
  first_row.each do |c|
    if key_target.match(c)
      has_header = nil
    end

  end
  

  if  !has_header
    puts "No header present in file.\n" + \
    "Using first row for implicit header values."
  else
       puts "Using first row to for explicit header values"
  end
 

  #We aren't going to bother with non-header files for now.  But
  #someday we will


  first_row.each do |column|
    row_hash[column.to_s] = nil
  end
  





#Now find the key_target in the second row, and store its index

#############
##
##  THERE CAN ONLY BE ONE COLMUMN CONTAINING THE TARGET KEY
##  (In this case, IP address)
##

  second_row.each_with_index do |val , indx|

    if key_target.match(val)
      target_column_index = indx
      print "The IP is " , val , " in column " , indx , "\n"
    end

  end

 @result_array[0] = first_row[target_column_index]


  #Now  we can suck the second row into the result

  first_row.each_with_index do |c, i|
    row_hash[c] = second_row[i]
  end


  @result_array[1] = row_hash
  #pp "ROW HASH" ,  row_hash
  
  #Read each remaining line; 
  #REMEBER: we already proccessed the first two rows!!!
  # extract each element, and placing it into hash
  #indexed by header column


   pp reader.inspect



  #end  def read_sheet(file_csv)
end

#end Input_Sheet
end

