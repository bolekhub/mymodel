//
//  File.swift
//  
//
//  Created by Boris Chirino on 8/9/22.
//

import Foundation

public protocol VideoSourceItemRepresentable: Codable, Identifiable where ID == String {
    var thumbnail: String { get }
    var title: String { get }
    var subtitle: String { get }
    var description: String { get }
    var sources: [String] { get }
}

public extension VideoSourceItemRepresentable {
    var id: ID {
        get {
            UUID().uuidString
        }
    }
}

public protocol CategoryRepresentable: Codable {
    var name: String { get }
    var videos: [VideoSourceItemRepresentable<String>] { get }
}

public protocol CatalogRepresentable: Codable {
    var categories: [CategoryRepresentable] { get }
}
