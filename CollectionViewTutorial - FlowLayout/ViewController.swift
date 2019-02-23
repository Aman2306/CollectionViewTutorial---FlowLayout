//
//  ViewController.swift
//  CollectionViewTutorial - FlowLayout
//
//  Created by Aman Meena on 23/02/19.
//  Copyright © 2019 Aman Meena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    
    // Variables
    var imageArray = [UIImage]()
    
    
    // Constants
    let reuseID = "DataCollectionViewCell"
    let segueID = "SegueShowDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0...21 {
            imageArray.append(UIImage(named: "image\(index)")!)
        }
//        createGradientLayer()
        callDelegates()
    }
    
    func callDelegates() {
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
    }
    
    func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }

    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as! CollectionViewCell
        cell.configureCell(image: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            vc.name = "label"
            vc.index = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            print("error")
        }
        
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = collectionView.bounds
//        print(bounds)
        // Size is relative to screen size so it will work on all devices
        return CGSize(width: bounds.width/3.0 - 10, height: bounds.height / 4) // it's necessary to substract additional space if left or right margin is given
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // Changes the horizontal spacing between the cells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0 // Changes the vertical spacing between the cells
    }
}
