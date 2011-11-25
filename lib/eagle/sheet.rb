module Eagle
  class Sheets < Array
    def parse(nodes)
      nodes.each { |node| push(Sheet.parse(node))} 
    end
  end

  class Sheet
    def self.parse(node)
      new
    end
  end
end
