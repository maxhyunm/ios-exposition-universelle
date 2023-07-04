//
//  DecodingManager.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/29.
//

import UIKit

struct DecodingManager {
    static let shared = DecodingManager() // 싱글톤 보통 쓰는 이름 shared
    
    func decodeJSON<T: Decodable>(fileName: String, type: T.Type) throws -> T {
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: fileName),
              let decodedData: T = try? decoder.decode(T.self, from: dataAsset.data)
        else {
            throw DecodingError.failedDecoding
        }
        
        return decodedData
    }
}
