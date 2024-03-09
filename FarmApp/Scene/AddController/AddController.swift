//
//  AddController.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 08.03.24.
//

import UIKit
import CoreData

class AddController: UIViewController {

    @IBOutlet private weak var productText: UITextField!
    @IBOutlet private weak var descriptionText: UITextField!
    @IBOutlet private weak var addPhoto: UIButton!
    
    private let imagePicker     = UIImagePickerController()
    private var productImages :   UIImage?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    

    func saveItem(productName: String) {
           let model = MyList(context: self.context)
           model.productName = productName
           
//           do {
//               try self.context.save()
//               //self.fetchItems()
//           } catch {
//               print(error.localizedDescription)
//           }
       }
    
    
//    func saveItem(productName: String) {
//        let entity = NSEntityDescription.entity(forEntityName: "Mylist", in: context)!
//        let model = MyList(entity: entity, insertInto: context)
//        model.productName = productName
//        
//        do {
//            try context.save()
//            // Perform any additional operations after saving
//        } catch {
//            print("Failed to save item:", error)
//        }
//    }

    
    
    
    private func configureImagePicker() {
        addPhoto.layer.cornerRadius         = 64
        addPhoto.layer.masksToBounds        = true
        addPhoto.imageView?.clipsToBounds   = true
        addPhoto.layer.borderColor          = UIColor.white.cgColor
        addPhoto.layer.borderWidth = 3
    }
    
    private func configureDelegate() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureDelegate()
        
        
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        self.saveItem(productName: self.productText.text ?? "title")
        // self.dismiss(animated: true)
        // self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func addClicked(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)

    }
    

}

//MARK: - ImagePickerController

extension AddController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let productImage = info[.editedImage] as? UIImage else { return }
        self.productImages = productImage
        configureImagePicker()
        self.addPhoto.setImage(productImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
    }
}
