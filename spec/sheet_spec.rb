require 'spec_helper'
require 'ruby-debug'

describe Sheet do
  let(:xml)   { Nokogiri::XML::Document.parse(SAMPLE_XML) }
  let(:sheet) { Sheet.new }

  subject { sheet }

  before { sheet.parse(xml.xpath('//drawing/schematic/sheets/sheet')) }

  specify { sheet.should have(2).instances }
  specify { sheet.should have(2).nets }
end
