//
//  main.swift
//  Stack
//
//  Created by Maxim Butin on 29.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import Foundation

// MARK: Test
var stack = Stack<Int>([])
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

print(stack)
if let poppedElement = stack.pop() {
  assert(4 == poppedElement)
  print("Popped element: \(poppedElement)")
}

if let peek = stack.peek() {
  assert(3 == peek)
  print("Peek element: \(peek)")
}

var array = ["A", "B", "C", "D"]
var stackString = Stack(array)
stackString.pop()
print(stackString)

var stackDouble: Stack = [1.0, 2.0, 3.0, 4.0]
stackDouble.push(5.0)
print(stackDouble)

// MARK: -- Challenge 1. Reverse an Array
/// Create a function that prints the contents of an array in reversed order.
func printInReverse<T>(_ array: [T]) {
  var stack = Stack<T>()
  
  for value in array {
    stack.push(value)
  }
  
  while let value = stack.pop() {
    print(value)
  }
}

printInReverse([3, 4, 5, 6])
