//
//  DataModel.swift
//  localExpressTestTask
//
//  Created by Давид Тоноян  on 04.12.2022.
//

import Foundation

struct DataItem {
    let itemName: String
    
    static func getFakeData(fromNumber startNumber: Int, toNumber endNumber: Int) -> [DataItem] {
        var dataArray = [DataItem]()
        for numberOfItem in startNumber...endNumber {
            let itemName = "Item \(numberOfItem)"
            let item = DataItem(itemName: itemName)
            dataArray.append(item)
        }
        
        return dataArray
    }
}
