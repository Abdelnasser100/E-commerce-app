//
//  ChatListViewController.swift
//  E-commerce app
//
//  Created by Abdelnasser on 01/04/2023.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet weak var ChatTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        register()
        
    }
    
    func register(){
        ChatTableView.register(UINib(nibName: "ChatListTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatListTableViewCell")
        ChatTableView.delegate = self
        ChatTableView.dataSource = self
    }

}



extension ChatListViewController: TableView_Delegate_DataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell", for: indexPath)as! ChatListTableViewCell
        
        if indexPath.row % 2 == 0{
            cell.stackView.alignment = .leading
            cell.messageLable.text = " ChatTableView.register(UINib(nibName: ChatListTableViewCell, bundle: nil), forCellReuseIdentifier: ChatListTableViewCell"
        }else{
            cell.stackView.alignment = .trailing
            cell.messageLable.text = " ChatTableView.register(UINib(nibName: ChatListTableViewCell, bundle: nil), forCellReuseIdentifier: ChatListTableViewCell ChatTableView.register(UINib(nibName: ChatListTableViewCell, bundle: nil), forCellReuseIdentifier: ChatListTableViewCell "
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
