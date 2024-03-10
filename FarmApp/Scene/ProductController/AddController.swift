//
//  AddController.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 08.03.24.
//

import UIKit
import CoreData

class AddController: UIViewController {
    
    
    @IBOutlet private weak var productText      : UITextField!
    @IBOutlet private weak var descriptionText  : UITextField!
    @IBOutlet private weak var addPhoto         : UIButton!
    
    //MARK: - Properties

    private let imagePicker     = UIImagePickerController()
    private var productImages :   UIImage?
    private let context          = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var coordinator: TitleCoordinator?

    
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDelegate()
    }
    
    //MARK: - Functions

   private  func makeAlert(titleInput: String, messageInput: String) {
        let alert     = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil )
    }
    
    private func saveItem(productName: String) {
        let model = MyList(context: self.context)
        model.productName = productName
        
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func configureImagePicker() {
        addPhoto.layer.cornerRadius         = 64
        addPhoto.layer.masksToBounds        = true
        addPhoto.imageView?.clipsToBounds   = true
        addPhoto.layer.borderColor          = UIColor.white.cgColor
        addPhoto.layer.borderWidth          = 3
        addPhoto.imageView?.contentMode     = .scaleAspectFit
    }
    
    private func configureDelegate() {
        imagePicker.delegate                = self
        imagePicker.allowsEditing           = true
        imagePicker.modalPresentationStyle  = .fullScreen
        navigationItem.hidesBackButton = true

    }
    //MARK: - Button

    
    @IBAction func saveClicked(_ sender: Any) {
        
        guard let productText = productText.text, !productText.isEmpty else {
            makeAlert(titleInput: "Warning!", messageInput: "You have not entered a product name!!!")
            return
        }
        
        guard let descriptionText = descriptionText.text, !descriptionText.isEmpty else {
            makeAlert(titleInput: "Warning!", messageInput: "You have not entered a descripton name!!!")
            return
        }
        
        self.saveItem(productName: self.productText.text ?? "title")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addClicked(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
