=begin

  BOM Generator - Generates a bill of materials from an EagleCAD schematic

  Usage: 

  $> ruby demos/bom.rb /path/to/schematic.sch > bom.csv

=end

require 'csv'
require_relative '../lib/eagle'

xml         = File.read(ARGV.first)
drawing     = Eagle::Drawing.parse(xml)
part_groups = drawing.parts.group_by {|part| "#{part.deviceset}-#{part.device}"}

CSV do |csv|
  csv << ['Quantity', 'Part', 'Names', 'Notes']

  part_groups.each do |part_name, parts|
    csv << [parts.count, part_name, parts.map(&:name).join(', '), '']
  end
end
