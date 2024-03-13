//
//  MailController.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 13.03.24.
//

import UIKit
import MessageUI

class MailController: UIViewController {

    
    @IBOutlet weak var subjectLabel: UITextField!
    
    @IBOutlet weak var mailLabel: UITextField!
    
    @IBOutlet weak var titleImage: UIImageView!
    
    var item: [MyList] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjectLabel.text = item.first?.shortdescription
        titleImage.image = UIImage(data: item.first?.productImage ?? Data())


    }
    

    @IBAction func sendClicked(_ sender: Any) {
        sendEmail()
    }
    
}


extension MailController: MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func sendEmail() {
        
        guard let recipient = mailLabel.text, !recipient.isEmpty else {
            print("Recipient email is empty.")
            return
        }
        
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.mailComposeDelegate = self
            mailComposeViewController.setToRecipients([recipient])
            mailComposeViewController.setSubject("RE: from xcode")
            mailComposeViewController.setMessageBody(subjectLabel.text ?? "", isHTML: false)
            
            if let image = titleImage.image {
                if let imageData = image.jpegData(compressionQuality: 1.0) {
                    mailComposeViewController.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "image.jpg")
                }
            }
            
            present(mailComposeViewController, animated: true, completion: nil)
        } else {
            // Show error message if user's device is not configured for sending emails
            print("Device is not configured for sending emails.")
        }
    }
    
    // MARK: - MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    }
