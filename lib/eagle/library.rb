module Eagle
  class Library
    attr_accessor :name, :description, :packages, :devicesets

    def initialize
      @packages = Packages.new
      @devicesets = DeviceSets.new
    end

    def parse(node)
      @name        = node[:name]
      @description = node.xpath('description').text
      @packages.parse(node.xpath('./packages/package'))
      @devicesets.parse(node.xpath('./devicesets/deviceset'))
    end
  end

  class Libraries < Array
    def parse(nodes)
      nodes.each do |node|
        library = Library.new
        library.parse(node)
        push(library)
      end
    end
  end
end
