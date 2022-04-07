//
//  Extension + Date.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import Foundation

extension String {
    func adjustFormat() -> String {
        let dateformatter = ISO8601DateFormatter()
        dateformatter.formatOptions = .withFullDate
        
        guard let date = dateformatter.date(from: self) else { return "" }
        return dateformatter.string(from: date)
    }
}
