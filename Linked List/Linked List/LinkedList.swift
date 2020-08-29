//
//  LinkedList.swift
//  Linked List
//
//  Created by Maxim Butin on 29.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import Foundation

public struct LinkedList<Value> {
  
  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  public var isEmpty: Bool {
    head == nil
  }
  
  public mutating func push(_ value: Value) {
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
  
  public mutating func append(_ value: Value) {
    
    guard !isEmpty else {
      push(value)
      return
    }
    
    tail!.next = Node(value: value)
    tail = tail!.next
  }
  
  public func node(at index: Int) -> Node<Value>? {
    var currentNode = head
    var currentIndex = 0
    
    while currentNode != nil && currentIndex < index {
      currentNode = currentNode!.next
      currentIndex += 1
    }
    
    return currentNode
  }
  
  @discardableResult
  public mutating func insert(_ value: Value,
                              after node: Node<Value>) -> Node<Value> {
    guard tail !== node else {
      append(value)
      return tail!
    }
    
    node.next = Node(value: value, next: node.next)
    return node.next!
  }
  
  @discardableResult
  public mutating func pop() -> Value? {
    defer {
      head = head?.next
      if isEmpty {
        tail = nil
      }
    }
    return head?.value
  }
  
}

extension LinkedList: CustomStringConvertible {
  
  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}