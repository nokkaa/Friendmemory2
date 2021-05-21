//
//  FaceViewController.swift
//  Friendmemory2
//
//  Created by nodoka on 2021/05/21.
//

import Foundation

class FaceViewController: UIViewController  {
@IBOutlet weak var backgroundImageView: UIImageView!
var imageNameArray: [String] = ["ああ.png", "いい.png", "うう.png", "shitumon.png"]
var imageindex: Int = 0
var imageView: UIImageView!

@IBAction func maruimeBtn(_ sender: Any) {
    imageindex = 1;
}

@IBAction func taremeBtn(_ sender: Any) {
     imageindex = 2;
}

@IBAction func turimeBtn(_ sender: Any) {
     imageindex = 3;
}

@IBAction func compBtn(_ sender: Any) {
     imageindex = 4;
}

@IBAction func backBtn(_ sender: Any) {
    self.imageView.removeFromSuperview()
}

@IBAction func pictureBtn(_ sender: Any) {
    let imagePickerController: UIImagePickerController = UIImagePickerController()
    
    imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
    imagePickerController.delegate = self
    imagePickerController.allowsEditing = true
    
    self.present(imagePickerController, animated: true, completion: nil)
}

func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    //imageに選んだ画像を設定
    let image = info[.originalImage] as? UIImage
    
    //imageを背景に設定
    backgroundImageView.image = image
    
    //close photo library
    self.dismiss(animated: true, completion: nil)
}

@IBAction func saveBtn(_ sender: Any) {
    
    let rect: CGRect = CGRect(x: 0, y: 30, width: 320, height: 380)
    UIGraphicsBeginImageContext(rect.size)
    self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
    let capture = UIGraphicsGetImageFromCurrentImageContext()
    
    UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
    
}

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    let touch: UITouch = touches.first!
    let location: CGPoint = touch.location(in: self.view)
    
    if imageindex != 0{
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let image: UIImage =  UIImage(named: imageNameArray[imageindex - 1])!
        
        imageView.image = image
        imageView.center = CGPoint(x: location.x, y: location.y)
        self.view.addSubview(imageView)
    }
    
    
}

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
}


}
