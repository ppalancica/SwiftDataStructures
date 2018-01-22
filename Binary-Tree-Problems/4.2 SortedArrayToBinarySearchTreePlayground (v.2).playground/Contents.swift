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

func printInOrder(rootNode: TreeNode!)
{
    if rootNode == nil {
        return
    }
    
    printInOrder(rootNode: rootNode.left)
    print("\(rootNode.data) ")
    printInOrder(rootNode: rootNode.right)
}

func buildBinarySearchTree(array: [Int]) -> TreeNode?
{
    return buildBinarySearchTree(array: array,
                                 startIndex: 0,
                                 endIndex: array.count - 1)
}

func buildBinarySearchTree(array: [Int],
                           startIndex: Int,
                           endIndex: Int) -> TreeNode?
{
    if startIndex > endIndex {
        return nil
    }
    
    let midIndex = (startIndex + endIndex) / 2
    let currentRoot = TreeNode(data: array[midIndex])
    
    currentRoot.left = buildBinarySearchTree(array: array,
                                             startIndex: startIndex,
                                             endIndex: midIndex - 1)

    currentRoot.right = buildBinarySearchTree(array: array,
                                              startIndex: midIndex + 1,
                                              endIndex: endIndex)
    return currentRoot
}

var root = buildBinarySearchTree(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

if let root = root {
    printInOrder(rootNode: root)
} else {
    print("root == nil")
}

print("End...")

