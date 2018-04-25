//
//  ViewController.swift
//  CollectionLayout
//
//  Created by Benoit PASQUIER on 22/04/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    lazy var collectionViewFlowLayout : CustomCollectionViewFlowLayout = {
        let layout = CustomCollectionViewFlowLayout(display: .grid)
        return layout
    }()
    
    let dataSource = ColorDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.collectionView.collectionViewLayout = self.collectionViewFlowLayout
        self.collectionView.dataSource = self.dataSource
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.collectionView.reloadData()
        }
        
        self.dataSource.data.value = [.red, .orange, .cyan, .purple, .yellow, .magenta] 
    }

    @IBAction func layoutValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 1:
            self.collectionViewFlowLayout.display = .list
        case 2:
            self.collectionViewFlowLayout.display = .inline
        default:
            self.collectionViewFlowLayout.display = .grid
        }
    }
}
