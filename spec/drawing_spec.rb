require 'nokogiri'

module Eagle
  class Drawing
    attr_accessor :version

    def self.load(xml)
      document = Nokogiri::XML::Document.parse(xml)
      drawing = Drawing.new
      drawing.version = document.xpath('/eagle').first['version']
      drawing
    end
  end
end

describe Eagle::Drawing do
  it "should load version" do
    Eagle::Drawing.load("<eagle version='5.91'/>").version.should == '5.91'
  end
end
