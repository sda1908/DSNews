//
//  NewsAPIResponse.swift
//  NewsAPIResponse
//
//  Created by Dmitry Seleznev on 7/16/21.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
}
