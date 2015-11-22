module Eagle
  class Technology
    attr_accessor :name, :attributes

    def initialize
      @attributes = Attributes.new
    end

    def parse(node)
      @name       = node[:name]
      @attributes.parse(node.xpath('./attribute'))
    end
  end

  class Technologies < Array
    def parse(nodes)
      nodes.each do |node|
        technology = Technology.new
        technology.parse(node)
        push(technology)
      end
    end
  end
end
