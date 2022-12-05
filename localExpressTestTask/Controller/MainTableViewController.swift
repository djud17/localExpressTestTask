//
//  TableViewController.swift
//  localExpressTestTask
//
//  Created by Давид Тоноян  on 04.12.2022.
//

import UIKit

final class MainTableViewController: UITableViewController {
    private var dataArray = [DataItem]()
    private var isLoadingData = false
    private var sections: [SectionType] = [.data, .loadingData]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        loadInitialData()
    }
    
    private func setupView() {
        view.backgroundColor = .darkGray
        
        tableView.allowsSelection = false
        tableView.register(nibModels: [CustomTableViewCellModel.self, LoadingDataTableViewCellModel.self])
    }
    
    private func loadInitialData() {
        dataArray = DataItem.getFakeData(fromNumber: 0, toNumber: 50)
        tableView.reloadData()
    }
    
    private func loadMoreData() {
        if !isLoadingData {
            isLoadingData = true
            let startNumber = dataArray.count
            let endNumber = startNumber + 20
            
            DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
                self.dataArray += DataItem.getFakeData(fromNumber: startNumber,
                                                       toNumber: endNumber)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.isLoadingData = false
                }
            }
        }
    }
}

extension MainTableViewController {
    
    // MARK: - Configure TableView
    
    private enum SectionType {
        case data
        case loadingData
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = sections[section]
        switch sectionType {
        case .data:
            return dataArray.count
        case .loadingData:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sections[indexPath.section]
        let model: CellViewAnyModel
        switch sectionType {
        case .data:
            let itemName = dataArray[indexPath.row].itemName
            model = CustomTableViewCellModel(itemName: itemName)
        case .loadingData:
            model = LoadingDataTableViewCellModel()
        }
        return tableView.dequeueReusableCell(withModel: model, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = sections[indexPath.section]
        let rowHeight: CGFloat
        switch sectionType {
        case .data:
            rowHeight = 50
        case .loadingData:
            rowHeight = 60
        }
        return rowHeight
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataArray.count - 20,
            !isLoadingData {
            loadMoreData()
        }
    }
}

extension UITableView {
    
    // MARK: - TableView extension
    
    func dequeueReusableCell(withModel model: CellViewAnyModel, for indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: type(of: model).cellAnyType)
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        model.setupAny(cell: cell)
        
        return cell
    }
    
    func register(nibModels: [CellViewAnyModel.Type]) {
        for model in nibModels {
            let identifier = String(describing: model.cellAnyType)
            let nib = UINib(nibName: identifier, bundle: nil)
            self.register(nib, forCellReuseIdentifier: identifier)
        }
    }
}
