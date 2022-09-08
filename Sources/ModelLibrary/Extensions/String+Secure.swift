//
//  String+Secure.swift
//  VideClub
//
//  Created by Boris Chirino on 7/9/22.
//

public extension String {
    func asSecureURL() -> String? {
        var mutableURL = self
        guard let index = self.firstIndex(of: ":") else {
            return nil
        }
        
        if mutableURL.prefix(through: index) == "https:" {
            return mutableURL
        } else {
            mutableURL.insert("s", at: index)
        }
        return mutableURL
    }
}
