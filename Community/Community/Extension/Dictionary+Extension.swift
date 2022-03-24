//
//  Dictionary+Extension.swift
//  Community
//
//  Created by Surasit Intawong on 2/2/2565 BE.
//

import Foundation

// MARK:- Transfomr Data
public extension Dictionary {
    
    func dataFromDictionary() -> Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return jsonData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    /// Transform the data type for decode
    /// - Parameters:
    ///   - data: Raw Data Type
    ///   - model: Specific Modal that need to transform
    /// - Returns: Generic Model Type transform to specific model (Optional it can be nil)
    func transformData<T>(data: Data?, model: T.Type) -> T? {
        guard let data = data, let decodableType = model as? Decodable.Type else { return nil }
        
        do {
            let result = try decodableType.init(jsonData: data)
            return result as? T
        } catch {
            debugPrint("Unexpected error: \(error).")
            return nil
        }
    }
}

public extension Decodable {
    init(jsonData: Data) throws {
        self = try JSONDecoder().decode(Self.self, from: jsonData)
    }
}
