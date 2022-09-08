//
//  VideoSourceItem.swift
//  VideClub
//
//  Created by Boris Chirino on 1/9/22.
//

import Foundation

struct Catalog: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let name: String
    let videos: [VideoSourceItem]
}

struct VideoSourceItem: Hashable, VideoSourceItemRepresentable, Identifiable, Codable {
    let id: String = UUID().uuidString
    let thumbnail: String
    let title: String
    let subtitle: String
    let description: String
    let sources:[String]
    
    enum CodingKeys: String, CodingKey {
        case thumbnail = "thumb"
        case title
        case subtitle
        case description
        case sources
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let thumbUrl = try container.decodeIfPresent(String.self, forKey: .thumbnail)
        self.thumbnail = thumbUrl?.asSecureURL() ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        let unsecureSources = try container.decodeIfPresent([String].self, forKey: .sources) ?? []
        var securedSources: [String] = []
        _ = unsecureSources.reduce(into: securedSources) { _, element in
            let securedUrl = element.asSecureURL()
            securedSources.append(securedUrl, conditionedBy: securedUrl != nil)
        }        
        self.sources = securedSources
    }
}
