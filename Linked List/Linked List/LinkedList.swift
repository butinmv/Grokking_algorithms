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
    copyNodes()
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
  
  public mutating func append(_ value: Value) {
    copyNodes()
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
    copyNodes()
    guard tail !== node else {
      append(value)
      return tail!
    }
    
    node.next = Node(value: value, next: node.next)
    return node.next!
  }
  
  @discardableResult
  public mutating func pop() -> Value? {
    copyNodes()
    defer {
      head = head?.next
      if isEmpty {
        tail = nil
      }
    }
    return head?.value
  }
  
  @discardableResult
  public mutating func removeLast() -> Value? {
    copyNodes()
    guard let head = head else {
      return nil
    }
    guard head.next != nil else {
      return pop()
    }
    
    var prev = head
    var current = head
    
    while let next = current.next {
      prev = current
      current = next
    }
    
    prev.next = nil
    tail = prev
    return current.value
  }
  
  @discardableResult
  public mutating func remove(after node: Node<Value>) -> Value? {
    guard let node = copyNodes(returningCopyOf: node) else {
      return nil
    }
    defer {
      if node.next === tail {
        tail = node
      }
      node.next = node.next?.next
    }
    return node.next?.value
  }
  
  private mutating func copyNodes() {
    guard !isKnownUniquelyReferenced(&head) else {
       return
    }
    
    guard var oldNode = head else {
      return
    }
    
    head = Node(value: oldNode.value)
    var newNode = head
    
    while let nextOldNode = oldNode.next {
      newNode!.next = Node(value: nextOldNode.value)
      newNode = newNode!.next
      
      oldNode = nextOldNode
    }
    
    tail = newNode
  }
  
  private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
    guard !isKnownUniquelyReferenced(&head) else {
       return nil
    }
    
    guard var oldNode = head else {
      return nil
    }
    
    head = Node(value: oldNode.value)
    var newNode = head
    var nodeCopy: Node<Value>?
    
    while let nextOldNode = oldNode.next {
      if oldNode === node {
        nodeCopy = newNode
      }
      newNode!.next = Node(value: nextOldNode.value)
      newNode = newNode!.next
      oldNode = nextOldNode
    }
    
    return nodeCopy
  }
}
