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
