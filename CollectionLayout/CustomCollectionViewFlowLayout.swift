//
//  CustomCollectionViewLayout.swift
//  CollectionLayout
//
//  Created by Benoit PASQUIER on 25/04/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import Foundation
import UIKit

enum CollectionDisplay {
    case inline
    case list
    case grid
}

class CustomCollectionViewFlowLayout : UICollectionViewFlowLayout {
    
    var display : CollectionDisplay = .grid {
        didSet {
            if display != oldValue {
                self.invalidateLayout()
            }
        }
    }
    
    convenience init(display: CollectionDisplay) {
        self.init()
        
        self.display = display
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
        self.configLayout()
    }
    
    func configLayout() {
        switch display {
        case .inline:
            self.scrollDirection = .horizontal
            if let collectionView = self.collectionView {
                self.itemSize = CGSize(width: collectionView.frame.width * 0.9, height: 300)
            }
            
        case .grid:
            
            self.scrollDirection = .vertical
            if let collectionView = self.collectionView {
                let optimisedWidth = (collectionView.frame.width - minimumInteritemSpacing) / 2
                self.itemSize = CGSize(width: optimisedWidth , height: optimisedWidth) // keep as square
            }
            
        case .list:
            self.scrollDirection = .vertical
            if let collectionView = self.collectionView {
                self.itemSize = CGSize(width: collectionView.frame.width , height: 130)
            }
        }
    }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        self.configLayout()
    }
}
