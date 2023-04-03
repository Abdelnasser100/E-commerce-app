//
//  FilterViewController.swift
//  E-commerce app
//
//  Created by Abdelnasser on 02/04/2023.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        register()
    }
    
    func register(){
        colorCollectionView.register(UINib(nibName: "ColorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorsCollectionViewCell")
        categoryCollectionView.register(UINib(nibName:"CategoryCollectionViewCell",bundle: nil),forCellWithReuseIdentifier: "CategoryCollectionViewCell" )
        
        colorCollectionView.dataSource = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }
    }
    
    @IBAction func didTappedCloseButton(_ sender: UIButton) {
        dismiss(animated: false)
    }
    

}


extension FilterViewController:CollectionView_Delegate_DataSource_FlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case colorCollectionView:
            return 10
        default:
            return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case colorCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath)as! ColorsCollectionViewCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath)as! CategoryCollectionViewCell
            cell.selectedBackgroundView?.backgroundColor = .red
            return cell
            
        }
    }

}


extension FilterViewController{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if collectionView == categoryCollectionView{
            let width = collectionView.frame.width / 3
            let height = collectionView.frame.height / 2
            return CGSize(width: width, height: height)
        }else{
            return CGSize()
        }
    }
    
}
