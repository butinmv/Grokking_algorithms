//
//  main.swift
//  Stack
//
//  Created by Maxim Butin on 29.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import Foundation

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

if let poppedElement = stack.pop() {
  assert(4 == poppedElement)
  print("Popped element: \(poppedElement)")
}

print(stack)

