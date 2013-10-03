require File.join(File.dirname(__FILE__),'Parser.rb')

sample = <<SAMP
SourceFolder: m:\mystuff\test
File: my_csv_file.csv {
   COL 1
 , COL_2
 , COL3 => TGTCOL3
}
SAMP

result =  Parser.parse sample
puts result.inspect
