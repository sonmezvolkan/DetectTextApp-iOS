//
//  ViewController.swift
//  DetectTextApp
//
//  Created by Volkan Sonmez on 6.11.2019.
//  Copyright © 2019 Porte. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController
{

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func btnDetectText_Click(_ sender: Any)
    {
        self.showOptions();
    }
}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    private func showOptions()
    {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet);
        actionSheet.addAction(UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.cancel, handler: { (action) in
            print("vazgeç");
        }));
        actionSheet.addAction(UIAlertAction(title: "Kamera", style: UIAlertAction.Style.default, handler: { (action) in
            self.showUIPicker(sourceType: .camera);
        }));
        actionSheet.addAction(UIAlertAction(title: "Galeri", style: UIAlertAction.Style.default, handler: { (action) in
            self.showUIPicker(sourceType: .photoLibrary);
        }));
        self.present(actionSheet, animated: true, completion: nil);
    }
    
    private func showUIPicker(sourceType: UIImagePickerController.SourceType)
    {
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self;
        imagePicker.allowsEditing = true;
        imagePicker.sourceType = sourceType;
        self.present(imagePicker, animated: true, completion: nil);
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else
        {
            print("No image found")
            return
        }
        self.imageView.image = image;
    }
}

