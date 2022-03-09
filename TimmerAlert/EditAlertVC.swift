//
//  EditAlertVC.swift
//  TimmerAlert
//
//  Created by Meghna on 09/03/22.
//

import UIKit

class EditAlertVC: UIViewController {
    
    @IBOutlet weak var lblReminingTimeValue: UILabel!
    @IBOutlet weak var txtDiscription: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var lblMainHeader: UILabel!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDiscription: UILabel!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var lblReminingTime: UILabel!
    
    var toolBar = UIToolbar()
    var datePicker  = UIDatePicker()
    
    var editTitle = ""
    var editDiscription = ""
    var editReminingTime = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prePareUI()
    }
}
extension EditAlertVC{
    func prePareUI(){
        
        lblMainHeader.font = UIFont.boldSystemFont(ofSize: 22)
        lblMainHeader.text = "Create Alert"
        
        lblTitle.font = UIFont.boldSystemFont(ofSize: 20)
        lblDiscription.font = UIFont.boldSystemFont(ofSize: 20)
        lblReminingTime.font = UIFont.boldSystemFont(ofSize: 20)
        
        lblTitle.text = "Alert Title"
        lblDiscription.text = "Discription"
        lblReminingTime.text = "Reminig Time"
        
        txtTitle.placeholder = "Enter Alert Title"
        txtDiscription.placeholder = "Enter Alert Discription"
        let tap = UITapGestureRecognizer(target: self, action: #selector(EditAlertVC.tapFunction))
        lblReminingTimeValue.isUserInteractionEnabled = true
        lblReminingTimeValue.addGestureRecognizer(tap)
        
        setData()
    }
    func setData(){
        txtTitle.text = editTitle
        txtDiscription.text = editDiscription
        lblReminingTimeValue.text = editReminingTime
    }
}
extension EditAlertVC{
    @IBAction func btnSaveClick(_ sender: UIButton) {
        
        
        if txtTitle.text == ""{
            
        }else if txtDiscription.text == ""{
            
        }else if lblReminingTimeValue.text == ""{
            
        }else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            vc.titleArray.append(txtTitle.text!)
            vc.discriptionArray.append(txtDiscription.text!)
            vc.timmerArray.append(lblReminingTimeValue.text!)
            vc.counter = Int(lblReminingTimeValue.text ?? "") ?? 1
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        print("tap working")
        datePicker = UIDatePicker.init()
        datePicker.backgroundColor = UIColor.white
        
        datePicker.autoresizingMask = .flexibleWidth
        datePicker.datePickerMode = .time
        
        datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
        datePicker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(datePicker)
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .blackTranslucent
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneButtonClick))]
        toolBar.sizeToFit()
        self.view.addSubview(toolBar)
    }
    @objc func dateChanged(_ sender: UIDatePicker?) {
        let dateFormatter = DateFormatter()
        // dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        
        if let date = sender?.date {
            print("Picked the date \(dateFormatter.string(from: date))")
            lblReminingTimeValue.text = "\(dateFormatter.string(from: date))"
        }
    }
    
    @objc func onDoneButtonClick() {
        toolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    
}

