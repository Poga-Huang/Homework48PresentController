//
//  AlertViewController.swift
//  Homework48PresentController
//
//  Created by 黃柏嘉 on 2022/1/3.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showAlert(_ sender: UIButton) {
//        let alert = UIAlertController(title: "訊息清單模式", message: "跟清單相關的訊息", preferredStyle: .actionSheet)
//        let action1 = UIAlertAction(title: "default", style: .default) { action1 in
//            alert.dismiss(animated: true, completion: nil)
//        }
//        let action2 = UIAlertAction(title: "cancel", style: .cancel) { action2 in
//            alert.dismiss(animated: true, completion: nil)
//        }
//        let action3 = UIAlertAction(title: "destructive", style: .destructive) { action3 in
//            alert.dismiss(animated: true, completion: nil)
//        }
//        alert.addAction(action1)
//        alert.addAction(action2)
//        alert.addAction(action3)
//        present(alert, animated: true, completion: nil)
//
        let alert = UIAlertController(title: "使用者資訊", message: "請輸入姓名及電話", preferredStyle: .alert)
        alert.addTextField { TextField in
            TextField.placeholder = "請輸入姓名"
        }
        alert.addTextField { TextField in
            TextField.placeholder = "請輸入電話號碼"
            TextField.keyboardType = .numberPad
        }
       
        let actionButton = UIAlertAction(title: "button", style:.default) { [unowned alert] _ in
            if let name = alert.textFields?[0].text,let phoneNumber = alert.textFields?[1].text{
                print(name,phoneNumber)
            }
            alert.dismiss(animated: true, completion: nil)
            
        }
        alert.addAction(actionButton)
        present(alert, animated: true, completion: nil)
    }
    
}
