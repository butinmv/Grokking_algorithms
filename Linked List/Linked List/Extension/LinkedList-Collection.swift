//
//  LinkedList-Collection.swift
//  Linked List
//
//  Created by Maxim Butin on 29.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import Foundation

extension LinkedList: CustomStringConvertible {
  
  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}

extension LinkedList: Collection {
  public var startIndex: Index {
    Index(node: head)
  }
  
  public var endIndex: Index {
    Index(node: tail?.next)
  }
  
  public func index(after i: Index) -> Index {
    Index(node: i.node?.next)
  }
  
  public subscript(position: Index) -> Value {
    position.node!.value
  }
  
  public struct Index: Comparable {
    
    public var node: Node<Value>?
    
    public static func == (lhs: Index, rhs: Index) -> Bool {
      switch (lhs.node, rhs.node){
      case let (left?, rigth?):
        return left.next === rigth.next
      case (nil, nil):
        return true
      default:
        return false
      }
    }
    
    static public func < (lhs: Index, rhs: Index) -> Bool {
      guard lhs != rhs else {
        return false
      }
      let nodes = sequence(first: lhs.node) { $0?.next }
      return nodes.contains { $0 === rhs.node }
    }
  }
}
