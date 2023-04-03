//
//  ProductDetailsViewController.swift
//  E-commerce app
//
//  Created by Abdelnasser on 01/04/2023.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var productImagesCollectionView: UICollectionView!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    
    var product :ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = product?.title
        
        register()

    }
    
    func register(){
        productImagesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        
        recommendedCollectionView.register(UINib(nibName: "GraidProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GraidProductCollectionViewCell")
        
        productImagesCollectionView.delegate = self
        productImagesCollectionView.dataSource = self
        recommendedCollectionView.delegate = self
        recommendedCollectionView.dataSource = self
    }

}


extension ProductDetailsViewController: CollectionView_Delegate_DataSource_FlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case productImagesCollectionView:
            return 3
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case productImagesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath)as! CategoriesCollectionViewCell
            cell.categoryName.isHidden = true
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GraidProductCollectionViewCell", for: indexPath)as! GraidProductCollectionViewCell
            return cell
        }
    }
  
}


extension ProductDetailsViewController{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case productImagesCollectionView:
            let width = collectionView.frame.width * 0.8
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
            
        default:
            let width = collectionView.frame.width / 2
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


