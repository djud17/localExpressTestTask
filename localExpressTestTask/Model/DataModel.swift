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
            let item = getDataItem(withId: numberOfItem)
            dataArray.append(item)
        }
        
        return dataArray
    }
    
    static private func getDataItem(withId itemId: Int) -> DataItem {
        let sleepTime = UInt32(Double(itemId) * 0.001)
        sleep(sleepTime)
        let itemName = "Item \(itemId)"
        let item = DataItem(itemName: itemName)
        return item
    }
}
