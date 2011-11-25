module Eagle
  class Drawing
    attr_accessor :version
    attr_reader :settings, :grid, :layers, :parts, :sheets

    def self.parse(xml)
      document = Nokogiri::XML::Document.parse(xml)
      drawing  = Drawing.new
      eagle    = document.xpath('/eagle').first

      drawing.version = eagle['version']
      drawing.settings.parse(eagle.xpath('drawing/settings/setting'))
      drawing.grid.parse(eagle.xpath('drawing/grid').first)
      drawing.layers.parse(eagle.xpath('drawing/layers/layer'))
      drawing.parts.parse(eagle.xpath('drawing/schematic/parts/part'))
      drawing.sheets.parse(eagle.xpath('drawing/schematic/sheets/sheet'))

      drawing
    end

    def initialize
      @settings = Settings.new
      @grid     = Grid.new
      @layers   = Layers.new
      @parts    = Parts.new
      @sheets   = Sheets.new
    end
  end
end
