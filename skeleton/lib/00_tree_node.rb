class PolyTreeNode
    def initialize(value) 
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children 
        @children 
    end

    def value
        @value 
    end

    #child.parent = the_parent
    def parent=(node)
        # @parent.remove_child(self) if parent 
        @parent.children.delete(self) if parent
        @parent = node
        @parent.children << self if parent && !parent.children.include?(self) 
    end

    def add_child(child_node)
        children << child_node
        child_node.parent = self 
    end

    def remove_child(child_node)
        raise "This is not a child" unless children.include?(child_node)
        child_node.parent = nil 
        children.delete(child_node)
    end

    def dfs(target_value)
        return self if self.value == target_value

        if self.children.length >= 1
            self.children.each do |child|
                child_result = child.dfs(target_value)
                return child_result if child_result
            end
        else
            return nil
        end

        return child_result 
    end

    def bfs(target_value)

    end

end