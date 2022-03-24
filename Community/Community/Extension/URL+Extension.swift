//
//  URL+Extension.swift
//  Community
//
//  Created by Surasit Intawong on 15/12/2564 BE.
//

import Foundation

public extension URL {
    var isValidURL: Bool {
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
        let result = predicate.evaluate(with: self.absoluteString)
        return result
    }
}
