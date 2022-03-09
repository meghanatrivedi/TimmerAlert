//
//  ViewController.swift
//  TimmerAlert
//
//  Created by Meghna on 09/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainHeaderView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tableView: UITableView!

    var titleArray = [String]()
    var discriptionArray = [String]()
    var timmerArray = [String]()
    
    var editTitle = ""
    var editDiscription = ""
    var editTimmer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prePareUI()
    }
}
extension ViewController{
    @IBAction func btnAddClick(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "EditAlertVC") as! EditAlertVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension ViewController{
    func prePareUI(){
        mainHeaderView.backgroundColor = .clear
        tableView.backgroundColor = .clear
        lblTitle.text = "Alerts"
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "Alertscell", bundle: nil), forCellReuseIdentifier: "Alertscell")
    }
}
extension ViewController : UITableViewDelegate ,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discriptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Alertscell", for: indexPath) as! Alertscell
        cell.parentVC = self
        cell.tag = indexPath.row
        cell.btnEdit.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(deleButtonClick), for: .touchUpInside)
        cell.btnDelete.tag = indexPath.row
        
        cell.title = titleArray[indexPath.row]
        cell.discription = discriptionArray[indexPath.row]
        cell.timmer = timmerArray[indexPath.row]
        
        if cell.lblRemaininTimeValue.text == "0.00"{
            self.titleArray.remove(at: indexPath.row)
            self.discriptionArray.remove(at: indexPath.row)
            self.timmerArray.remove(at: indexPath.row)
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension ViewController{
    func editButtomClick() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "EditAlertVC") as! EditAlertVC
        vc.editTitle = editTitle
        vc.editDiscription = editDiscription
        vc.editReminingTime = editTimmer
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func deleButtonClick(_ sender: UIButton) {
        self.titleArray.remove(at: sender.tag)
        self.discriptionArray.remove(at: sender.tag)
        self.timmerArray.remove(at: sender.tag)
        self.tableView.reloadData()
    }
    
    
}
