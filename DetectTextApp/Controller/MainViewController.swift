//
//  ViewController.swift
//  DetectTextApp
//
//  Created by Volkan Sonmez on 6.11.2019.
//  Copyright © 2019 Porte. All rights reserved.
//

import UIKit
import FirebaseMLVision;
import Lottie;

class MainViewController: BaseViewController
{
    @IBOutlet weak var imageView: UIImageView!
    
    private var detectText: IDetectText?;
    
    private static let ERROR_TEXT = "Üzgünüz fiş aradığımız kelimeleri içermiyor.";
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        self.setUp();
    }
    
    private func setUp()
    {
        self.detectText = HelperInjection.getVisionInstance();
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
        self.detectionText(image: image);
        self.imageView.image = image;
    }
}

extension MainViewController
{
    private func detectionText(image: UIImage)
    {
        guard let detectText = detectText else { return; }
        detectText.getText(image: image, onSuccess: { (result) in
            self.checkResult(result: result);
        }, onError: { (error) in
            self.showError(message: error);
        });
    }
    
    private func checkResult(result: String)
    {
        print(result);
        for word in Constant.SEARCHED_WORD
        {
            if (result.contains(word))
            {
                self.showCongrulations();
                return;
            }
        }
        self.showError(message: MainViewController.ERROR_TEXT);
    }
    
    private func showCongrulations()
    {
        let animation = Animation.named("complete")
        let animationView = AnimationView();
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height * 2 / 3);
        view.addSubview(animationView);
        animationView.play { (isFinish) in
            animationView.removeFromSuperview();
            self.showSuccess();
        }
        self.view.bringSubviewToFront(animationView);
    }
    
    private func showSuccess()
    {
        
    }
    
    private func showError(message: String)
    {
        
    }
}
