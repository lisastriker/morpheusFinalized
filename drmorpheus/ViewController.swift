//
//  ViewController.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 20/11/19.
//  Copyright © 2019 NUS Anaesthesia . All rights reserved.
//

import UIKit
import PaperOnboarding

class ViewController: UIViewController {

    
    @IBOutlet weak var LearningBotButton: UIButton!
   
   
    @IBAction func LearningBotOpen(_ sender: Any) {
        self.performSegue(withIdentifier: "LearningBotSegue", sender: self)
    }
    
    @IBAction func NusEntradaOpenButtonPressed(_ sender: Any) {
        let url = URL(string:"https://entrada.nusmedicine.nus.edu.sg")
        
        if UIApplication.shared.canOpenURL(url!){
            UIApplication.shared.open(url!, options: [:], completionHandler:{(success) in print("Successfully opened")} )
        
        }
        else {
            return
        }
    }
    
    
    @IBAction func DrugDosingOpenButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "DrugDosingSegue", sender: self)
    }
    
    @IBAction func VideoOpenButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "videoSegue", sender: self)
    }
 
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    

}
}
