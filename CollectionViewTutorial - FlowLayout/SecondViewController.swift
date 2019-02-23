//
//  SecondViewController.swift
//  CollectionViewTutorial - FlowLayout
//
//  Created by Aman Meena on 23/02/19.
//  Copyright © 2019 Aman Meena. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // Outlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondLabe: UILabel!
    
    
    // Variables
    var name = ""
    var index = 0
    
    // Constants
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = name
        imageView.image = UIImage(named: "image\(index)")
        secondLabe.text = name
        print(name, index)
    }

}
