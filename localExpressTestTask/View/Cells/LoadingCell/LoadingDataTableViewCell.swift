//
//  LoadingDataTableViewCell.swift
//  localExpressTestTask
//
//  Created by Давид Тоноян  on 04.12.2022.
//

import UIKit

final class LoadingDataTableViewCell: UITableViewCell {
    @IBOutlet weak var loadingDataActivityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        loadingDataActivityIndicator.color = .white
    }
}

struct LoadingDataTableViewCellModel: CellViewModel {
    func setup(cell: LoadingDataTableViewCell) {
        cell.loadingDataActivityIndicator.startAnimating()
    }
}
