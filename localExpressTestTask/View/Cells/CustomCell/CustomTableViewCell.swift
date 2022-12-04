//
//  CustomTableViewCell.swift
//  localExpressTestTask
//
//  Created by Давид Тоноян  on 04.12.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

struct CustomTableViewCellModel {
    let itemName: String
}

extension CustomTableViewCellModel: CellViewModel {
    func setup(cell: CustomTableViewCell) {
        cell.itemNameLabel.text = itemName
    }
}
