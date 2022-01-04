//
//  MFComposeViewController.swift
//  Homework48PresentController
//
//  Created by 黃柏嘉 on 2022/1/4.
//

import UIKit
import MessageUI


class MFComposeViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    
    

    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMFMessageComposeVC(_ sender: UIButton) {
        showMFMessage(phoneNumber: phoneNumberLabel.text)
    }
    @IBAction func showMFMailCompose(_ sender: UIButton) {
        showMFMail(emailAddress: emailAddressLabel.text)
    }
    
    //MFMailComposeViewController
    func showMFMail(emailAddress:String?){
        if !MFMailComposeViewController.canSendMail(){
            print("此裝置無法使用寄信功能")
            return
        }
        let compose = MFMailComposeViewController()
        compose.mailComposeDelegate = self
        compose.setToRecipients([emailAddress ?? ""])
        compose.setSubject("練習測試")
        compose.setMessageBody("Hello~~~", isHTML: false)
        present(compose, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if error != nil{
            print("發送失敗")
        }
        switch result {
        case .cancelled:
            print("取消發送")
        case .saved:
            print("儲存草稿")
        case .sent:
            print("寄信成功")
        case .failed:
            print("發送失敗")
        @unknown default:
            print("不明")
        }
        controller.dismiss(animated: true, completion: nil)
    }
    //MFMessageComposeViewController
    func showMFMessage(phoneNumber:String?){
        if !MFMessageComposeViewController.canSendText(){
            print("此裝置無法使用簡訊功能")
            return
        }
        let compose = MFMessageComposeViewController()
        compose.messageComposeDelegate = self
        compose.recipients = [phoneNumber ?? ""]
        compose.body = "測試簡訊"
        present(compose, animated: true, completion: nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            print("使用者取消")
        case .sent:
            print("發送成功")
        case .failed:
            print("發送失敗")
        @unknown default:
            print("不明")
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
}
