//: Playground - noun: a place where people can play

import Foundation

print("Start...")

class TreeNode
{
    var data: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(data: Int)
    {
        self.data = data
        left = nil
        right = nil
    }
}

func isBinarySearchTree(rootNode: TreeNode?) -> Bool
{
    return isBinarySearchTree(node: rootNode, min: -10000, max: 10000)
}

func isBinarySearchTree(node: TreeNode!, min: Int, max: Int) -> Bool
{
    if node == nil {
        return true
    }
    
    if node.data < min || node.data > max {
        return false
    }
    
    return isBinarySearchTree(node: node.left, min: min, max: node.data - 1)
        && isBinarySearchTree(node: node.right, min: node.data + 1, max: max)
}

var root = TreeNode(data: 4)
var node1 = TreeNode(data: 2)
var node2 = TreeNode(data: 5)
var node3 = TreeNode(data: 6) // Changing 6 to 3 will break the BST rule

root.left = node1
root.right = node2
node2.right = node3

if isBinarySearchTree(rootNode: root) {
    print("root is BST")
} else {
    print("root is not BST")
}

print("End...")

