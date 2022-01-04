//
//  ViewController.swift
//  Homework48PresentController
//
//  Created by 黃柏嘉 on 2022/1/4.
//

import UIKit

class ViewController: UIViewController,UIColorPickerViewControllerDelegate,UIFontPickerViewControllerDelegate {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    @IBAction func setBackgroudColor(_ sender: UIButton) {
        showColorPicker()
    }
    @IBAction func setLabelFont(_ sender: UIButton) {
        showFontPicker()
    }
    //UIColorPickerViewController
    func showColorPicker(){
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        present(colorPicker, animated: true, completion: nil)
    }

    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        view.backgroundColor = viewController.selectedColor
        viewController.dismiss(animated: true, completion: nil)
    }
    
    //UIFontPickerController
    func showFontPicker(){
        let configuration = UIFontPickerViewController.Configuration()
        configuration.includeFaces = true
        let controller = UIFontPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        guard let descriptor = viewController.selectedFontDescriptor else{return}
        myLabel.font = UIFont(descriptor: descriptor, size: 40)
        viewController.dismiss(animated: true, completion: nil)
    }
   
    
}
