module Eagle
  class Technology
    attr_accessor :name

    def parse(node)
      @name       = node[:name]
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
