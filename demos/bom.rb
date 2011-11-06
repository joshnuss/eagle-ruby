=begin
Generates a bill of materials

Usage: 

$> ruby demos/bom.rb /path/to/schematic.sch > bom.csv
=end

$: << File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'eagle'
require 'csv'

drawing = Eagle::Drawing.parse(File.read(ARGV[0]))
groups = {}
drawing.parts.each do |part|
  part_name = "#{part.deviceset} #{part.device}"
  (groups[part_name] ||= []) << part
end

puts CSV.generate_line(['Part', 'Library', 'Quantity', 'Names'])

groups.each do |part_name, parts|
  puts CSV.generate_line([part_name, parts.first.library, parts.count, parts.map(&:name).join(', ')])
end
