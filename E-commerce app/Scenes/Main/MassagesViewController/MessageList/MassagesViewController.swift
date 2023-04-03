//
//  MassagesViewController.swift
//  E-commerce app
//
//  Created by Abdelnasser on 29/03/2023.
//

import UIKit

class MassagesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "Massages"
        registerTableView()
    }
    

    func registerTableView(){
        tableView.register(UINib(nibName: "MassagesTableViewCell", bundle: nil), forCellReuseIdentifier: "MassagesTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
  

}


extension MassagesViewController: TableView_Delegate_DataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MassagesTableViewCell", for: indexPath)as! MassagesTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "ChatListViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
