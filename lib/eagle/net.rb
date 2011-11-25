module Eagle
  class Net
    def parse(node)
    end
  end

  class Nets < Array
    def parse(nodes)
      nodes.each do |node|
        net = Net.new
        net.parse(node)

        push(net)
      end
    end
  end
end

