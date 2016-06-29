class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end


def print_operators(node)
  return if node == nil
  if "+-*%/".include? node.value
    print_operators(node.left)
    print node.value + " "
    print_operators(node.right)
  end
end

# def count_non_operators(node, count = 0)
#   return if count > 2
#     unless "+-*%/".include? node.value
#     count += 1
#     count_non_operators(node.right, count)
#   end
# end

def count_non_operators(node)
  return 1 if /\d+/.match(node.value)
    return (count_non_operators(node.left) + count_non_operators(node.right))
end

def print_prefix(node)
  return if node == nil
  print node.value + " "
  print_prefix(node.left)
  print_prefix(node.right)
end

def print_postfix(node)
  return if node == nil
  print_postfix(node.left)
  print_postfix(node.right)
  print node.value + " "
end

root = TreeNode.new("-")
root.left = TreeNode.new("+")
root.right = TreeNode.new("10")
root.left.right = TreeNode.new("2")
root.left.left = TreeNode.new("3")

print_infix(root)
puts
print_operators(root)
puts
count_non_operators(root)
puts
puts "I want  - + 4 3 10"
puts
puts print_prefix(root)

root2 = TreeNode.new("+")
root2.left = TreeNode.new("*")
root2.right = TreeNode.new("2")
root2.left.right = TreeNode.new("4")
root2.left.left = TreeNode.new("3")

print_infix(root2)
puts
print_operators(root2)
puts count_non_operators(root2)
puts
puts "I want + * 4 3 2"
puts print_prefix(root2)
puts
puts
root3 = TreeNode.new("-")
root3.left = TreeNode.new("*")
root3.left.right = TreeNode.new("+")
root3.left.left = TreeNode.new("4")
root3.left.right.left = TreeNode.new("3")
root3.left.right.right = TreeNode.new("2")
root3.right = TreeNode.new("%")
root3.right.left = TreeNode.new("10")
root3.right.right = TreeNode.new("5")


print_infix(root3)
puts
print_operators(root3)
puts count_non_operators(root3)
puts
puts "I want - + * 4 3 2 % 10 5"
puts print_prefix(root3)
puts print_postfix(root3)
