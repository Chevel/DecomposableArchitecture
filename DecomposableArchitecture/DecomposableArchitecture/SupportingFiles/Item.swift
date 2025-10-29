//
//  Item.swift
//  DecomposableArchitecture
//
//  Created by Matej on 29. 10. 25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
