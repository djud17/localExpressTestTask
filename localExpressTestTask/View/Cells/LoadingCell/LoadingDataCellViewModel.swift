//
//  LoadingDataCellViewModel.swift
//  localExpressTestTask
//
//  Created by Давид Тоноян  on 04.12.2022.
//

import UIKit

struct LoadingDataTableViewCellModel: CellViewModel {
    func setup(cell: LoadingDataTableViewCell) {
        cell.loadingDataActivityIndicator.startAnimating()
    }
}
