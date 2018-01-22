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
    if array.count == 0 {
        return nil
    }
    
    if array.count == 1 {
        return TreeNode(data: array[0])
    }
    
    let midIndex = array.count / 2
    let currentRoot = TreeNode(data: array[midIndex])
    var subArray1: [Int] = []
    var subArray2: [Int] = []
    
    for i in 0..<midIndex {
        subArray1.append(array[i])
    }
    
    if (midIndex + 1 < array.count) {
        for i in midIndex + 1..<array.count {
            subArray2.append(array[i])
        }
    }
    
    currentRoot.left = buildBinarySearchTree(array: subArray1)
    currentRoot.right = buildBinarySearchTree(array: subArray2)
    
    return currentRoot
}

var root = buildBinarySearchTree(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

if let root = root {
    printInOrder(rootNode: root)
} else {
    print("root == nil")
}

print("End...")

