module Eagle
  class Drawing
    attr_accessor :version
    attr_reader :grid, :layers, :parts

    def self.parse(xml)
      document = Nokogiri::XML::Document.parse(xml)
      drawing = Drawing.new
      eagle = document.xpath('/eagle').first

      drawing.version = eagle['version']
      drawing.grid.parse(eagle.xpath('drawing/grid').first)
      drawing.layers.parse(eagle.xpath('drawing/layers/layer'))
      drawing.parts.parse(eagle.xpath('drawing/schematic/parts/part'))

      drawing
    end

    def initialize
      @grid   = Grid.new
      @layers = Layers.new
      @parts  = Parts.new
    end
  end
end

