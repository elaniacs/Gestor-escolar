//
//  HomeViewController.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 27/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeViewModel: HomeViewModel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    weak var mainCoordinator: MainCoordinator?
    
    override func viewWillAppear(_ animated: Bool) {
        title = "E.E.F.M. CS"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        homeViewModel?.getAllMenu(completion: {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
        let cellWidth: CGFloat = (UIScreen.main.bounds.width - 40) / 3.0
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth + 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.sectionInset = edgeInsets
        collectionView.collectionViewLayout = layout
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        title = ""
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if cell?.tag == 35 {
            mainCoordinator?.callScheduleViewController()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel?.menuCell.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCVCell", for: indexPath) as? HomeCVCell else { return UICollectionViewCell() }
        cell.tag = Int(homeViewModel?.menu[indexPath.row].opc ?? "") ?? 0
        if let data = homeViewModel?.menuCell[indexPath.row] {
            cell.populateCell(data: data)
        }
        
        return cell
     
    }
}
