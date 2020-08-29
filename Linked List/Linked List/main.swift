//
//  main.swift
//  Linked List
//
//  Created by Maxim Butin on 29.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import Foundation

// MARK: Creating and linking nodes
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

// MARK: Test Push To Linked List
var list1 = LinkedList<Int>()
list1.push(3)
list1.push(4)
list1.push(5)

print(list1)


// MARK: Tets Append To Linked List
var list2 = LinkedList<Int>()
list2.append(1)
list2.append(2)
list2.append(3)

print(list2)

// MARK: Test inserting at a particular index
var list3 = LinkedList<Int>()
list3.push(3)
list3.push(2)
list3.push(1)

print("Before inserting: \(list3)")
var middleNode = list3.node(at: 1)!
for _ in 1...4 {
  middleNode = list3.insert(-1, after: middleNode)
}
print("After inserting: \(list3)")

// MARK: Test of Pop operation
list3.pop()
print(list3)

// MARK: Test Removing Last operation
print("Before removing: \(list3)")
let removedValue = list3.removeLast()

print("After removing last node: \(list3)")
print("Removed value: " + String(describing: removedValue))

// MARK: Test removing a node after a particular node
var list4 = LinkedList<Int>()
list4.push(3)
list4.push(2)
list4.push(1)

print("Befor removing at particular index: \(list4)")
let index = 1
let node = list4.node(at: index - 1)!
let removedValue1 = list4.remove(after: node)

print("After removing at index \(index): \(list4)")
print("Removing value: " + String(describing: removedValue1))

// MARK: Using Collection
var listCollection = LinkedList<Int>()
for i in 0...9 {
  listCollection.append(i)
}
print("List: \(listCollection)")
print("First element: \(listCollection[listCollection.startIndex])")
print("Array contains first 3 elements: \(Array(listCollection.prefix(3)))")
print("Array contains last 3 elements: \(Array(listCollection.suffix(3)))")

let sum = listCollection.reduce(0, +)
print("Sum of all values: \(sum)")


// MARK: Linked list COW (cope-on-write)
var list5 = LinkedList<Int>()
list5.append(1)
list5.append(2)
var list6 = list5
print(list5)
print(list6)

print("After appending 3 to list 2")
list6.append(3)
print(list5)
print(list6)

// MARK: Removing middle node on list8
var list7 = LinkedList<Int>()
list7.append(1)
list7.append(2)
var list8 = list7
print(list7)
print(list8)

print("After appending 3 to list 2")
list8.append(3)
print(list7)
print(list8)

print("Removing middle node on list8")
if let node = list8.node(at: 0) {
  list8.remove(after: node)
}
print(list8)
