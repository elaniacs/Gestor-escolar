//
//  ScheduleViewController.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 29/05/23.
//


import UIKit


class ScheduleViewController: UIViewController {
    
    var scheduleViewModel: ScheduleViewModel?
    @IBOutlet weak var scheduleTableView: UITableView!
    weak var mainCoordinator: MainCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        scheduleViewModel?.gellAllSchedule(completion: {
            DispatchQueue.main.async {
                self.scheduleTableView.reloadData()
            }
        })
    }
}


extension ScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        scheduleViewModel?.scheduleCell.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scheduleViewModel?.scheduleCell[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = scheduleTableView.dequeueReusableCell(withIdentifier: "ScheduleTVCell", for: indexPath) as? ScheduleTVCell else { return UITableViewCell() }
        
        if let data = scheduleViewModel?.scheduleCell[indexPath.section][indexPath.row] {
            cell.populateCell(data: data)
        }
        
        return cell
    }
    
    
}
