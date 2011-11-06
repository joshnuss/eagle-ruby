module Eagle
  class Part
    attr_accessor :name, :library, :deviceset, :device, :technology

    def parse(node)
      @name       = node[:name]
      @library    = node[:library]
      @deviceset  = node[:deviceset]
      @device     = node[:device]
      @technology = node[:technology]
    end
  end

  class Parts < Array
    def parse(nodes)
      nodes.each do |node|
        part = Part.new
        part.parse(node)
        push(part)
      end
    end
  end
end
