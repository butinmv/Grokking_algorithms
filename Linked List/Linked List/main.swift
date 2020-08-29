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
