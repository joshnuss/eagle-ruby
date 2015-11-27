module Eagle
  class Attribute
    attr_accessor :name, :value, :constant

    def parse(node)
      @name     = node[:name]
      @value    = node[:value]
      @constant = node[:constant]
    end
  end

  class Attributes < Array
    def parse(nodes)
      nodes.each do |node|
        attribute = Attribute.new
        attribute.parse(node)
        push(attribute)
      end
    end
  end
end
