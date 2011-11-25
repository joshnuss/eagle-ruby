module Eagle
  class Sheets < Array
    def parse(nodes)
      nodes.each do |node| 
        sheet = Sheet.new
        sheet.parse(node)

        push(sheet)
      end
    end
  end

  class Sheet
    attr_reader :instances

    def initialize
      @instances = Instances.new
    end

    def parse(node)
      @instances.parse(node.xpath('./instances/instance'))
    end
  end
end
