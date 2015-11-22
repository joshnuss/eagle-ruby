module Eagle
  class Package
    attr_accessor :name, :description

    def parse(node)
      @name        = node[:name]
      @description = node.xpath('description')
    end
  end

  class Packages < Array
    def parse(nodes)
      nodes.each do |node|
        package = Package.new
        package.parse(node)

        push(package)
      end
    end
  end
end

