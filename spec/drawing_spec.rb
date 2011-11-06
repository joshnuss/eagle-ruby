require 'nokogiri'

module Eagle
  class Grid
    attr_accessor :distance
  end

  class Drawing
    attr_accessor :version
    attr_reader :grid

    def self.load(xml)
      document = Nokogiri::XML::Document.parse(xml)
      drawing = Drawing.new
      eagle = document.xpath('/eagle').first
      grid = eagle.xpath('//grid').first

      drawing.version = eagle['version']
      drawing.grid.distance = grid['distance'].to_f

      drawing
    end

    def initialize
      @grid = Grid.new
    end
  end
end

describe Eagle::Drawing do
  XML = <<-EOS
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="5.91">
  <drawing>
    <settings>
      <setting alwaysvectorfont="no"/>
      <setting verticaltext="up"/>
    </settings>
    <grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
    <layers>
      <layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
      <layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
      <layer number="93" name="Pins" color="2" fill="1" visible="no" active="no"/>
      <layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
      <layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
      <layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
      <layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
      <layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
    </layers>
    <schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
      <libraries>
      </libraries>
      <attributes>
      </attributes>
      <variantdefs>
      </variantdefs>
      <classes>
        <class number="0" name="default" width="0" drill="0">
        </class>
      </classes>
      <parts>
      </parts>
      <sheets>
        <sheet>
          <plain>
          </plain>
          <instances>
          </instances>
          <busses>
          </busses>
          <nets>
          </nets>
        </sheet>
      </sheets>
    </schematic>
  </drawing>
</eagle>
  EOS

  context "parsing" do
    let(:document) { Eagle::Drawing.load(XML) }

    subject { document }

    its(:version) { should == '5.91' }
    
    context "grid" do
      subject { document.grid }
      its(:distance) { should == 0.1 }
    end

  end
end
