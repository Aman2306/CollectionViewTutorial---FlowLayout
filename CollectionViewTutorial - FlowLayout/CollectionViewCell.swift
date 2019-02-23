//
//  CollectionViewCell.swift
//  CollectionViewTutorial - FlowLayout
//
//  Created by Aman Meena on 23/02/19.
//  Copyright © 2019 Aman Meena. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    func configureCell( image: UIImage) {
        imageViewOutlet.image = image
    }
}
