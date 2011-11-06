module Eagle
  class Grid
    attr_accessor :distance, :unit, :alternate_unit, :alternate_unit_distanceance, :display, :style, :multiple, :alternate_distance, :unit_distance, :alternate_unit_distance

    def parse(node)
      @distance                = node['distance'].to_f
      @unit_distance           = node['unitdist']
      @unit                    = node['unit']
      @style                   = node['style']
      @multiple                = node['multiple'].to_f
      @display                 = node['display'] == 'yes'
      @alternate_distance      = node['altdistance'].to_f
      @alternate_unit_distance = node['altunitdist']
      @alternate_unit          = node['altunit']
    end
  end
end
