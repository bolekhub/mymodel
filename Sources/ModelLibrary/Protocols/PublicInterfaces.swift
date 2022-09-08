//
//  File.swift
//  
//
//  Created by Boris Chirino on 8/9/22.
//

import Foundation


public protocol VideoSourceItemRepresentable: Codable {
    var thumbnail: String { get }
    var title: String { get }
    var subtitle: String { get }
    var description: String { get }
    var sources: [String] { get }
}

public protocol CategoryRepresentable: Codable {
    var name: String { get }
    var videos: [VideoSourceItemRepresentable] { get }
}

public protocol CatalogRepresentable: Codable {
    var categories: [CategoryRepresentable] { get }
}
