//
//  Models.swift
//  VamBuket
//
//  Created by tasya on 26.03.2021.
//  Copyright © 2021 Taisiya V. All rights reserved.
//

import Foundation

//struct Data: Decodable {
//    let data: DataClass
//}
//
//struct DataClass: Decodable {
//    let attributes: Attributes
//}

struct Attributes: Decodable {
    let firstName: String
    let lastName: String
    let phohe: String
    let email: String
    let role: String

}
