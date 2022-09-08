//
//  Array+Helpers.swift
//  VideClub
//
//  Created by Boris Chirino on 7/9/22.
//

public extension Array where Element: Hashable {
    mutating func append(_ newElement: Element?, conditionedBy condition: Bool ) {
        if let element = newElement, condition {
            append(element)
        }
    }
}
