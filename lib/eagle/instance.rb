module Eagle
  class Instance
    def parse(node)
    end
  end

  class Instances < Array
    def parse(nodes)
      nodes.each do |node|
        instance = Instance.new
        instance.parse(node)

        push(instance)
      end
    end
  end
end

