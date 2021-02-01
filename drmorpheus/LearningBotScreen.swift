//
//  LearningBotScreen.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 25/11/19.
//  Copyright © 2019 NUS Anaesthesia . All rights reserved.
//

import UIKit


class LearningBotScreen: UIViewController {
    
    
    

    @IBOutlet weak var GoogleAssistantButtonFormat: UIButton!{
        didSet{
            GoogleAssistantButtonFormat.layer.cornerRadius = 3
            GoogleAssistantButtonFormat.layer.borderWidth = 1
            GoogleAssistantButtonFormat.layer.borderColor = UIColor.black.cgColor
            GoogleAssistantButtonFormat.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            GoogleAssistantButtonFormat.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            GoogleAssistantButtonFormat.layer.shadowOpacity = 1.0
            GoogleAssistantButtonFormat.layer.shadowRadius = 0.0
            GoogleAssistantButtonFormat.layer.masksToBounds = false
        }
        
    }
    
    @IBOutlet weak var FirstDescription: UILabel!
    
    
    @IBOutlet weak var SecondDescription: UILabel!
    


    @IBAction func googleAssistantOpenButtonPressed(_ sender: Any) {
        
        let googleAssistantUrl = URL(string:"googleassistant://")!

        if (UIApplication.shared.canOpenURL(googleAssistantUrl)) {
                print("opening");
                UIApplication.shared.open(googleAssistantUrl)
        }
        else{
            print("download app")
            UIApplication.shared.open(URL(string: "http://apps.apple.com/sg/app/id1220976145")!, options: [:], completionHandler: nil)
            }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        onboardingView.dataSource = self
//        onboardingView.delegate = self
//        self.navigationItem.hidesBackButton = false
    }
}




