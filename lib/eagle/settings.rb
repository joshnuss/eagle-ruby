module Eagle
  class Settings
    def initialize
      @values = {}
    end

    def parse(xml)
      xml.each do |node| 
        attribute_name = node.attributes.keys.last
        attribute = node.attributes[attribute_name]
        @values[attribute_name] = attribute.value
      end
    end

    def [](key)
      @values[key.to_s]
    end
  end
end
