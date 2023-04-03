//
//  SortByViewController.swift
//  E-commerce app
//
//  Created by Abdelnasser on 28/03/2023.
//

import UIKit


protocol SortProtocol: AnyObject {
    func didChangedort(title:String)
}

class SortByViewController: UIViewController {
    
    
    @IBOutlet var listViews: [UIView]!
    @IBOutlet var listLabels: [UILabel]!
    

    var delegate: SortProtocol?
    
    var soryArray:[String] = ["Price: Highest to low", "Popular", "Newest", "Customer review"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
   
    
    @IBAction func didTappedListButton(_ sender: UIButton) {
        
        let title = soryArray[sender.tag]
        delegate?.didChangedort(title: title)
        
        listViews.forEach({$0.backgroundColor = .white})
        listViews.first(where: {$0.tag == sender.tag})?.backgroundColor = .red
        
        for x in listLabels{
            if x.tag == sender.tag {
                x.textColor = .white
            }else{
                x.textColor = .black
            }
        }
    }
    
 

}
