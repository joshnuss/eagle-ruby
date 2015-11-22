module Eagle
  class Device
    attr_accessor :name, :package, :technologies

    def initialize
      @technologies = Technologies.new
    end

    def parse(node)
      @name       = node[:name]
      @package    = node[:package]
      @technologies.parse(node.xpath('./technologies/technology'))
    end
  end

  class Devices < Array
    def parse(nodes)
      nodes.each do |node|
        device = Device.new
        device.parse(node)
        push(device)
      end
    end
  end
end
