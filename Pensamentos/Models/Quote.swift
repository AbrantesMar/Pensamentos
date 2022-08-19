//
//  Quote.swift
//  Pensamentos
//
//  Created by Marcio Abrantes on 12/08/22.
//

import Foundation

struct Quote : Codable {
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return " ` " + quote + "`"
    }
    
    var authorFormatted: String {
        return "- " + author + " -"
    }
}
