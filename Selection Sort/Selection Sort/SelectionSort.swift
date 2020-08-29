//
//  SelectionSort.swift
//  Selection Sort
//
//  Created by Maxim Butin on 29.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import Foundation

public func selectionSort<Element>(_ array: inout [Element])
  where Element: Comparable {
    guard array.count >= 2 else {
      return
    }
    
    for current in 0..<(array.count - 1) {
      var lowest = current
      for other in (current + 1)..<array.count {
        if array[lowest] > array[other] {
          lowest = other
        }
      }
      if lowest != current {
        array.swapAt(lowest, current)
      }
    }
}
