module Eagle
  class DeviceSet
    attr_accessor :name, :prefix, :description, :uservalue, :devices

    def initialize
      @devices    = Devices.new
    end

    def parse(node)
      @name        = node[:name]
      @prefix      = node[:prefix]
      @uservalue   = node[:uservalue]
      @description = node.xpath('description').text
      @devices.parse(node.xpath('./devices/device'))
    end
  end

  class DeviceSets < Array
    def parse(nodes)
      nodes.each do |node|
        deviceset = DeviceSet.new
        deviceset.parse(node)
        push(deviceset)
      end
    end
  end
end
