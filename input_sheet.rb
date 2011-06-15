require 'csv'



# Pretty print objects for a better debugging experience
# Declaration should probably be removed in final version
require 'pp'

class Input_Sheet
  
  attr_accessor :result_array , :header_array , :working_file
  
  
  def initialize(file_csv)
    
    # Input: CSV file 

    @working_file = File::basename(file_csv)
    
    # Output: array of arrays.  first element of array contains the
    # index key, the other elements contain hashes corresponding to each
    # row.
    
    
    
    
    @result_array = Array.new
    
    row_hash = Hash.new
    @header_array = Array.new
    
    #This will hold the column number of the key value
    target_column_index = nil  #Becomes int at runtime
    
    #In the inital version, the sheet will be keyed by IP; the regexp
    #below should caputre only those.
    
    #This regexp will match non-valid IP addresses like 299.299.299.299
    #but it should be good enough for now.
    key_target = \
    /[0-2]?[0-9]?[0-9]\.[0-2]?[0-9]?[0-9].[0-2]?[0-9]?[0-9]\.[0-2]?[0-9]?[0-9]/ 
    
    
    
    
    
    reader = CSV.open(file_csv , 'r') 
    
    
    
    
    
    #Read the first line, if it conatins no key_target, then it is a
    #header lile, save it as :header If it does contain an instance of
    #key_target, then the file does not contain a header, and its keys
    #are constructed by column number.
    
    #Get first row
    first_row = reader.shift
    
    
    #And the second
    second_row = reader.shift
    
    
    #Find out if fist row contains the  key_target; this does nothing now
  
    has_header = true
    
    first_row.each do |c|
      if key_target.match(c)
        has_header = nil
      end
    
    end
    
    #We aren't going to bother with non-header files for now.  But
    #someday we will; for now it will always default to "has header ==
    #true" since that was defined above
    
    if  !has_header
      puts "No header present in file.\n" + \
      "Using first row for implicit header values." + \
       "  However, this is not supported now, so exiting\n"
      
      break
    else
      puts "Using first row to for explicit header values"
    end
    
    first_row.each do |column, i|
      @header_array  <<  column.to_s
      
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
    
    first_row.each_with_index do |c, ix|
      row_hash[c] = second_row[ix]
    end
    
    
    @result_array[1] = row_hash
    
    
    #Read in each remaining line; 
    
    reader.each do |row|  
      
      this_hash = {}
      
      row.each_with_index do  |cell , i|
        this_hash[@header_array[i]] = cell
      end
      
       unless this_hash.empty? 
         @result_array << this_hash
       end
      
      # end reader.each
    end
    
    
    
    #end  def read_sheet(file_csv)
  end
  
  #end Input_Sheet
end
