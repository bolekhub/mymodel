//
//  File.swift
//  
//
//  Created by Boris Chirino on 8/9/22.
//

public protocol VideoSourceItemRepresentable {
    var thumbnail: String { get }
    var title: String { get }
    var subtitle: String { get }
    var description: String { get }
    var sources: [String] { get }
}

public protocol CategoryRepresentable {
    var name: String
    var videos: [VideoSourceItemRepresentable]
}

public protocol CatalogRepresentable {
    var categories: [CategoryRepresentable] { get }
}
