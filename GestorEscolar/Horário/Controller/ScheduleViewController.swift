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
        
        title = "HORÁRIO"
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
       
        
        if #available(iOS 15.0, *) {
            scheduleTableView.sectionHeaderTopPadding = 0
        }
        
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ScheduleTVHeader(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 24))
        header.populateHeader(title: scheduleViewModel?.schedule?.horario[section].dia)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
