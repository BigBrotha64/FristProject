//
//  Item.swift
//  FristProject
//
//  Created by Alexander Kemp on 23/9/23.
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
