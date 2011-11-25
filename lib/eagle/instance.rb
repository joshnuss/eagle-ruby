module Eagle
  class Instance
    attr_accessor :part, :gate, :x, :y

    def parse(node)
      @part = node['part']
      @gate = node['gate']
      @x    = node['x'].to_f
      @y    = node['y'].to_f
    end
  end

  class Instances < Array
    def parse(nodes)
      nodes.each do |node|
        instance = Instance.new
        instance.parse(node)

        push(instance)
      end
    end
  end
end

