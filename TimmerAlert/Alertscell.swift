//
//  Alertscell.swift
//  TimmerAlert
//
//  Created by Meghna on 09/03/22.
//

import UIKit

class Alertscell: UITableViewCell {

    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var lblRemainingTime: UILabel!
    @IBOutlet weak var lblDiscription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRemaininTimeValue: UILabel!
    @IBOutlet weak var lblDiscriptionValue: UILabel!
    @IBOutlet weak var lblTitleValue: UILabel!
    
    var parentVC : UIViewController?
    var title : String?
    var discription : String?
    var timmer: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prePareCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
extension Alertscell{
    func prePareCell(){
        
        lblTitle.font = UIFont.boldSystemFont(ofSize: 20)
        lblDiscription.font = UIFont.boldSystemFont(ofSize: 20)
        lblRemainingTime.font = UIFont.boldSystemFont(ofSize: 20)
        
        lblTitleValue.font = UIFont.systemFont(ofSize: 20.0)
        lblDiscriptionValue.font = UIFont.systemFont(ofSize: 20.0)
        lblRemaininTimeValue.font = UIFont.systemFont(ofSize: 20.0)
        
        
        lblTitle.text = "Alert Title:"
        lblDiscription.text = "Description:"
        lblRemainingTime.text = "Remining Time:"
        
    }
    
    func setData(){
        lblTitleValue.text = title
        lblDiscriptionValue.text = discription
        lblRemaininTimeValue.text = timmer
    }
}

extension Alertscell{
    @IBAction func btnEditClick(_ sender: UIButton) {
        if let parentVC = parentVC as? ViewController {
            parentVC.editTitle = lblTitleValue.text ?? ""
            parentVC.editDiscription = lblDiscriptionValue.text ?? ""
            parentVC.editTimmer = lblRemaininTimeValue.text ?? ""
            parentVC.editButtomClick()
        }
    }
    
}
