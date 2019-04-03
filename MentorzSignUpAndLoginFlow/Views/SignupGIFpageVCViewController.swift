//
//  SignupGIFpageVCViewController.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
import FLAnimatedImage

class SignupGIFpageVCViewController: UIViewController {

    @IBOutlet weak var myGIF: FLAnimatedImageView!
    
    override func viewDidLoad() {
      
        
        super.viewDidLoad()
        makeGIF()

        // Do any additional setup after loading the view.
    }
    func makeGIF(){
        let path = Bundle.main.path(forResource: "onBoardVideo", ofType: "gif")
        let url = URL(fileURLWithPath: path!)
        let gifData = try? Data(contentsOf: url)
        let imageData1 = try? FLAnimatedImage(animatedGIFData: gifData)
        myGIF.animatedImage = imageData1 as! FLAnimatedImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
