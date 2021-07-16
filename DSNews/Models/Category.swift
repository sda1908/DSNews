//
//  Category.swift
//  Category
//
//  Created by Dmitry Seleznev on 7/16/21.
//

import Foundation

enum Category: String, CaseIterable {
    case business
    
    var text: String {
        if self == .business {
            return "Business Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
