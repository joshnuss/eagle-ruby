require 'spec_helper'

describe Instance do
  let(:xml)   { Nokogiri::XML::Document.parse(SAMPLE_XML) }
  let(:instance) { Instance.new }

  before { instance.parse(xml.xpath('//instance[1]').first) }

  subject { instance }

  its(:part) { should == 'C1'}
  its(:gate) { should == 'G$1'}
  its(:x) { should == 22.86 }
  its(:y) { should == 53.34 }
end
