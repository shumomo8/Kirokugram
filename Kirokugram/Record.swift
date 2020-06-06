//
//  Record.swift
//  Kirokugram
//
//  Created by Shu Fujita on 2020/06/06.
//  Copyright © 2020 Fujita shu. All rights reserved.
//

import Foundation
import RealmSwift

class Record: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var place: String = ""
    @objc dynamic var date: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var memo: String = ""
    @objc dynamic var category: String = ""


}
