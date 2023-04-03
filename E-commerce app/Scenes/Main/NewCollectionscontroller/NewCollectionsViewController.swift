//
//  NewCollectionsViewController.swift
//  E-commerce app
//
//  Created by Abdelnasser on 24/03/2023.
//

import UIKit


struct ProductModel {
    var id : Int
    var image: String
    var title: String
    var des: String
    var price: Int
    
    init(id :Int, image: String, title: String, des: String, price: Int) {
        self.id = id
        self.image = image
        self.title = title
        self.des = des
        self.price = price
    }
}

class NewCollectionsViewController: UIViewController, SortProtocol {

    
    //MARK: -  OutLets
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionVIew: UICollectionView!
    @IBOutlet weak var gridListButton: UIButton!
    @IBOutlet weak var sortButton: UIButton!
    
    
    //MARK: -  Vars
    let subCategoriesName:[String] = ["T-shirt", "hoodes", "summer", "asvfs"]
    var isList:Bool = true
    
    let productModel: [ProductModel] = [
        ProductModel(id: 1, image: "Pullover", title: "Pullover", des: "Mange", price: 51),
        ProductModel(id: 2, image: "T-shirt", title: "T-shirt", des: "Doroth Perkins", price: 34),
        ProductModel(id: 3, image: "Shirt", title: "Shirt", des: "Topshirt", price: 99)]

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCollectionView()
    }
    
    
    func registerCollectionView(){
        subCategoryCollectionView.register(UINib(nibName: "SubCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SubCategoriesCollectionViewCell")
        
        productsCollectionVIew.register(UINib(nibName: "ListProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListProductCollectionViewCell")
        
        productsCollectionVIew.register(UINib(nibName: "GraidProductCollectionViewCell",bundle: nil),forCellWithReuseIdentifier: "GraidProductCollectionViewCell")
        
        productsCollectionVIew.delegate = self
        productsCollectionVIew.dataSource = self
        subCategoryCollectionView.delegate = self
        subCategoryCollectionView.dataSource = self
        
    }
    
    
    
    @IBAction func didTappedFilterButton(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "FilterViewController")
        viewController.modalPresentationStyle = .overFullScreen
        
        let transtion = CATransition()
        transtion.duration = 0.2
        transtion.type = .fade
        view.window?.layer.add(transtion, forKey: kCATransition)
        present(viewController, animated: false)
    }
    
    
    
    @IBAction func didTappedGrid_ListButton(_ sender: UIButton) {
        
        isList.toggle()
        let imageList = UIImage(named:"list")
        let imageGrid = UIImage(named:"grid")
        let image = isList == true ? imageGrid : imageList
        gridListButton.setImage(image, for: .normal)
        productsCollectionVIew.reloadData()
    }
    
    
    @IBAction func didTappedSortButton(_ sender: UIButton) {
        
     goToSortViewController()
    }
    
    
    func goToSortViewController(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "SortByViewController")as! SortByViewController
        viewController.delegate = self
        
        viewController.modalPresentationStyle = .overFullScreen
        
        let transtion = CATransition()
        transtion.duration = 0.2
        transtion.type = .fade
        view.window?.layer.add(transtion, forKey: kCATransition)
        present(viewController, animated: false)
    }
    
    
    func didChangedort(title: String) {
        sortButton.setTitle(title, for: .normal)
    }
    
    
}


extension NewCollectionsViewController: CollectionView_Delegate_DataSource_FlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if collectionView == subCategoryCollectionView{
            return subCategoriesName.count
        }else if collectionView == productsCollectionVIew{
            return productModel.count
        }else{
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case subCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoriesCollectionViewCell", for: indexPath)as! SubCategoriesCollectionViewCell
            cell.categoryNameLable.text = subCategoriesName[indexPath.row]
            return cell
            
        default:
            if isList == true{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListProductCollectionViewCell", for: indexPath)as! ListProductCollectionViewCell
                let model = productModel[indexPath.row]
                cell.productImage.image = UIImage(named: model.image)
                cell.titleLable.text = model.title
                cell.desLable.text = model.des
                cell.priceLable.text = "$ \(model.price)"
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GraidProductCollectionViewCell", for: indexPath)as! GraidProductCollectionViewCell
                cell.munisSaleLable.isHidden = true
                let model = productModel[indexPath.row]
                cell.productImage.image = UIImage(named: model.image)
                cell.titleLable.text = model.title
                cell.desLable.text = model.des
                cell.priceLable.text = "$ \(model.price)"
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = productModel[indexPath.row]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "ProductDetailsViewController")as! ProductDetailsViewController
        viewController.product = product
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension NewCollectionsViewController{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case subCategoryCollectionView:
            let width = collectionView.frame.width - 40
            let height = collectionView.frame.height
            return CGSize(width: width/3, height: height)
            
        default:
            if isList == true{
                let width = collectionView.frame.width
                return CGSize(width: width, height: 160)
            }else{
                let width = collectionView.frame.width
                return CGSize(width: width/2, height: 240)
            }
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
