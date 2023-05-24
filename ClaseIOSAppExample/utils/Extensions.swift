//
//  Extensions.swift
//  ClaseIOSAppExample
//
//  Created by Melvin Antonio Callisaya Tiñini on 28/4/23.
//

import Foundation
import CryptoKit



extension Date {
    func timestamp() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}

extension String {
    func md5() -> String {
        let com = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return com.map { String(format: "%02hhx", $0)}.joined()
    }

}
