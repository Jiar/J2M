//
//  J2M.swift
//  J2M
//
//  Created by Jiar on 2017/7/12.
//  Copyright © 2017年 Jiar. All rights reserved.
//

import Foundation

public final class J2M<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public extension Encodable {
    public var j2m: J2M<Self> {
        get { return J2M(self) }
    }
}

/// Encodable Encode
public extension J2M where Base: Encodable {
    func toJson() -> String? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        guard let encoded = try? encoder.encode(base) else {
            return nil
        }
        guard let json = String(data: encoded, encoding: .utf8) else {
            return nil
        }
        return json
    }
}

/// String Decode
public extension J2M where Base == String {
    func toModel<T>(type: T.Type) -> T? where T: Codable {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let data = base.data(using: .utf8) else {
            return nil
        }
        guard let model = try? decoder.decode(type, from: data) else {
            return nil
        }
        return model
    }
}

/// Data Decode
public extension J2M where Base == Data {
    func toModel<T>(type: T.Type) -> T? where T: Codable {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let model = try? decoder.decode(type, from: base) else {
            return nil
        }
        return model
    }
}
