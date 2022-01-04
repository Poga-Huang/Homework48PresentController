//
//  WebListTableViewController.swift
//  Homework48PresentController
//
//  Created by 黃柏嘉 on 2022/1/3.
//

import UIKit
import SafariServices

class WebListTableViewController: UITableViewController,SFSafariViewControllerDelegate{
    
    struct PropertyKeys{
        static let webItemCellIdentifier = "WebItemCell"
    }
    
    let webArray = [
        WebAddress(webName: "Google", webAddress: "https://www.google.com.tw/?hl=zh_TW"),
        WebAddress(webName: "Youtube", webAddress: "https://www.youtube.com/"),
        WebAddress(webName: "Apple", webAddress: "https://www.apple.com/tw/"),
        WebAddress(webName: "Wikipedia", webAddress: "https://zh.wikipedia.org/wiki/Wikipedia:%E9%A6%96%E9%A1%B5")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return webArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.webItemCellIdentifier, for: indexPath) as! WebItemTableViewCell
        cell.itemName.text = webArray[indexPath.row].webName
        cell.itemImage.image = UIImage(named: webArray[indexPath.row].webName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: webArray[indexPath.row].webAddress){
            let controller = SFSafariViewController(url: url)
            controller.delegate = self
            controller.dismissButtonStyle = .cancel
            controller.preferredBarTintColor = .blue
            controller.preferredControlTintColor = .orange
            present(controller, animated: true, completion: nil)
        }
    }
    
}
