//
//  ApiRest.swift
//  ClaseIOSAppExample
//
//  Created by Melvin Antonio Callisaya Tiñini on 28/4/23.
//

import Foundation
import Alamofire

class ApiRest {
    static let BASE_URL = "https://gateway.marvel.com:443/v1/public/"
    private static let maxWaitTime = 60.0
    private static let apiKey = "4e18ee757059f528ba825a17e9d077a9"
    private static let privateKey = "b33340b1ed47b89ea5f3037f1d150609437a2d35"
    
    
    static func getCharacters() async throws -> Characters {
        let timestamp = Date().timestamp()
        let hash = "\(timestamp)\(privateKey)\(apiKey)".md5()
        let params: Parameters = [
            "apikey": "4e18ee757059f528ba825a17e9d077a9",
            "ts": timestamp,
            "hash": hash
        ]
        return try await request(path: "characters", parameters: params)
    }
    
    
    
    
    
    private static func request<T: Decodable>(
        path: String,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        return try await  withCheckedThrowingContinuation{ continuation in
            AF.request(
                BASE_URL + path,
                parameters: parameters,
                headers: headers,
                requestModifier: { $0.timeoutInterval = self.maxWaitTime }
            )
            .responseData { response in
                switch(response.result) {
                case let .success(data):
                    do {
                        let decoder: JSONDecoder = JSONDecoder()
                        let res = try decoder.decode(T.self, from: data)
                        continuation.resume(returning: res)
                    } catch let err {
                        continuation.resume(throwing: err)
                    }
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
