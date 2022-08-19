//
//  QuotesManager.swift
//  Pensamentos
//
//  Created by Marcio Abrantes on 12/08/22.
//

import Foundation
import UIKit

class QuoteManager {
    let quotes: [Quote]
    
    init(){
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
    }
    
    func getRandomQuote() -> Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
}
