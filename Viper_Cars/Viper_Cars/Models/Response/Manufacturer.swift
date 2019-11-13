//
//  Manufacturer.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import Foundation

struct Manufacturer: Codable {
    let page: Int?
    let pageSize: Int?
    let totalPageCount: Int?
    let wkda: [String: String]?
}

struct Wkda {
    let code: String?
    let name: String?
    let key: String?
    let value: String?
}
