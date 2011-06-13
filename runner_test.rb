#!/usr/bin/env ruby


require 'pp'





load './cat_2_spread.rb'


@file_one = ARGV[0]

if  @file_one == nil
  puts "Remeber to supply a file"
  break
end


read_sheet= Input_Sheet.new(@file_one)

pp "Read Sheet" , read_sheet.result_array
pp "Read Sheet size" , read_sheet.result_array.size

