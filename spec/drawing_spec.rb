require 'nokogiri'

module Eagle
  class Grid
    attr_accessor :distance, :unit, :alternate_unit, :alternate_unit_distanceance, :display, :style, :multiple, :alternate_distance, :unit_distance, :alternate_unit_distance

    def load(node)
      @distance                = node['distance'].to_f
      @unit_distance           = node['unitdist']
      @unit                    = node['unit']
      @style                   = node['style']
      @multiple                = node['multiple'].to_f
      @display                 = node['display']
      @alternate_distance      = node['altdistance'].to_f
      @alternate_unit_distance = node['altunitdist']
      @alternate_unit          = node['altunit']
    end
  end

  class Layer
  end

  class Layers < Array
    def load(nodes)
      nodes.each do |node|
        push(Layer.new)
      end
    end
  end

  class Drawing
    attr_accessor :version
    attr_reader :grid, :layers

    def self.load(xml)
      document = Nokogiri::XML::Document.parse(xml)
      drawing = Drawing.new
      eagle = document.xpath('/eagle').first

      drawing.version = eagle['version']
      drawing.grid.load(eagle.xpath('drawing/grid').first)
      drawing.layers.load(eagle.xpath('drawing/layers/layer'))

      drawing
    end

    def initialize
      @grid   = Grid.new
      @layers = Layers.new
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
      its(:unit_distance) { should == 'inch' }
      its(:unit) { should == 'inch' }
      its(:style) { should == 'lines' }
      its(:multiple) { should == 1 }
      its(:display) { should == 'no' }
      its(:alternate_distance) { should == 0.01 }
      its(:alternate_unit_distance) { should == 'inch' }
      its(:alternate_unit) { should == 'inch' }
    end

    context "layers" do
      subject { document.layers }

      its(:count) { should == 8 }
    end
  end
end
