module Eagle
  class Layer
    attr_accessor :number, :name, :color, :fill, :visible, :active

    def parse(node)
      @number  = node[:number].to_i
      @name    = node[:name]
      @color   = node[:color].to_i
      @fill    = node[:fill].to_i
      @visible = node[:visible] == 'yes'
      @active  = node[:active] == 'yes'
    end
  end

  class Layers < Array
    def parse(nodes)
      nodes.each do |node|
        layer = Layer.new
        layer.parse(node)

        push(layer)
      end
    end
  end
end
