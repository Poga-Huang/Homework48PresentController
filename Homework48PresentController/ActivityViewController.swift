//
//  ActivityViewController.swift
//  Homework48PresentController
//
//  Created by 黃柏嘉 on 2022/1/3.
//

import UIKit
import PhotosUI

class ActivityViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    
    

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var mediumAddressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        for i in images{
            if i.image == nil{
                i.image = UIImage(systemName: "person.circle.fill")
            }
        }
    }
   
    
    
    @IBAction func share(_ sender: UIButton) {
        let activityViewController = UIActivityViewController(activityItems: [headshotImageView.image!,mediumAddressLabel.text!], applicationActivities: nil)
        
        activityViewController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if error != nil{
                print("失敗")
                return
            }
            if completed {
                print("成功")
            }
        }
        present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func updateHeadshot(_ sender: UIButton) {
//        selectSouceTypeAlert()
        selectPHPickerImage()
    }
    
    //UIImagePickerViewController
    func selectHeadshot(type:UIImagePickerController.SourceType){
        if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            print("此裝置沒有相簿")
            return
        }
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            print("此裝置沒有相機")
            return
        }
        let controller = UIImagePickerController()
        controller.sourceType = type
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectImage = info[.originalImage] as? UIImage{
            headshotImageView.image = selectImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    //PHPickerViewController
    
    func selectPHPickerImage(){
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 2
        let phpicker = PHPickerViewController(configuration: configuration)
        phpicker.delegate = self
        present(phpicker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let items = results.map(\.itemProvider)
        for (i,item) in items.enumerated() where item.canLoadObject(ofClass: UIImage.self){
            let previousImage = images[i].image
            item.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    guard let image = image as? UIImage,self.images[i].image == previousImage else {return}
                        self.images[i].image = image
                        picker.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    
    
    
    func selectSouceTypeAlert(){
        let alert = UIAlertController(title: "請選擇", message: "更換大頭照的來源", preferredStyle: .actionSheet)
        let photoLibraryAction = UIAlertAction(title: "從相簿內選擇", style: .default) { _ in
            self.selectHeadshot(type: .photoLibrary)
            alert.dismiss(animated: true, completion: nil)
        }
        let cameraAction = UIAlertAction(title: "相機拍照", style: .default) { _ in
            self.selectHeadshot(type: .camera)
            alert.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(photoLibraryAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    

}
