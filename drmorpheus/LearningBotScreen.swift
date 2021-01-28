//
//  LearningBotScreen.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 25/11/19.
//  Copyright © 2019 NUS Anaesthesia . All rights reserved.
//

import UIKit
import PaperOnboarding


class LearningBotScreen: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    
    

    @IBOutlet weak var GoogleAssistantButtonFormat: UIButton!{
        didSet{
            GoogleAssistantButtonFormat.layer.cornerRadius = 3
            GoogleAssistantButtonFormat.layer.borderWidth = 1
            GoogleAssistantButtonFormat.layer.borderColor = UIColor.white.cgColor
            GoogleAssistantButtonFormat.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            GoogleAssistantButtonFormat.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            GoogleAssistantButtonFormat.layer.shadowOpacity = 1.0
            GoogleAssistantButtonFormat.layer.shadowRadius = 0.0
            GoogleAssistantButtonFormat.layer.masksToBounds = false
        }
        
    }
    @IBOutlet weak var onboardingView: OnboardingView!

    

    
    func onboardinPageItemRadius() -> CGFloat {
        12.5
    }
    
    func onboardingPageItemColor(at index:Int)-> UIColor{
        UIColor.white
    }
    
    func onboardingPageItemSelectedRadius() -> CGFloat {
    25
}
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let backgroundcolor1 = UIColor(named: "LightBlueGrey")
        let titlefont1 = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionfont2 = UIFont(name : "EuphemiaUCAS", size:14)!
        return[OnboardingItemInfo(informationImage: UIImage(named : "onboarding1")!,
            title: "GETTING STARTED",
            description:"Doctor morpheus is learning bot inside Google Assistant. To being, you need to enter Google Assistant and say/type \"Talk to My Tutor Doctor Morpheus.\" \n \n Please finish reading this set of instruction. The button to access Google Assistant is below and should be pressed at the end of the instructions.",
            pageIcon: UIImage(named: "key")!,
            color:backgroundcolor1!,
            titleColor:UIColor.black,
            descriptionColor:UIColor.black,
            titleFont:titlefont1,
        descriptionFont:descriptionfont2),
            
            OnboardingItemInfo(informationImage: UIImage(named : "onboarding2")!,
                title: "Begin Quiz / Scenario",
                description:"Once you have entered the bot, a standard greeting is played. The bot has 2 functions. To begin say/type \"Start Quiz/Start Scenario.\" \n \n To change out of the quiz or scenario say/type \"Stop Quiz/Stop Scenario\"",
                pageIcon:UIImage(named: "key")!,
                color:backgroundcolor1!,
                titleColor:UIColor.black,
                descriptionColor:UIColor.black,
                titleFont:titlefont1,
        descriptionFont:descriptionfont2),
            
            OnboardingItemInfo(informationImage: UIImage(named : "onboarding3")!,
                    title: "Airway Calculator",
                    description:"The bot has an airway calculator that can give you the drug administration dose for a patient of x kg and the ETT size based on a patient's gender and age. \n \n To access this function, you should say/type \"What drug dosing should i use\" or \"What ETT size should i use\"",
                    pageIcon: UIImage(named: "key")!,
                    color:backgroundcolor1!,
                    titleColor:UIColor.black,
                    descriptionColor:UIColor.black,
                    titleFont:titlefont1,
            descriptionFont:descriptionfont2),
            
            OnboardingItemInfo(informationImage: UIImage(named : "onboarding4")!,
                title: "Error Occurs",
                description:"If you encounter any errors where the bot stops asking questions or gives an answer without further follow up, simply say \"Please give me the answer\". \n \n This will cause the error to be undone.",
                pageIcon: UIImage(named: "key")!,
                color:backgroundcolor1!,
                titleColor:UIColor.black,
                descriptionColor:UIColor.black,
                titleFont:titlefont1,
                descriptionFont:descriptionfont2)
            
            
            
            ][index]
       
    }

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
    func onboardingItemsCount() -> Int {
        4
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index _: Int) {
         item.descriptionLabel!.textAlignment = NSTextAlignment.left;
    }

    /*func onboardingWillTransitionToIndex(_ index:Int){
        if index == 1 {
            if self.GoogleAssistantButton.alpha == 1 {
                UIView.animate(withDuration: 0.4, animations: {self.GoogleAssistantButton.alpha = 0})
            }
        
        }
        
        }*/
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        onboardingView.dataSource = self
        onboardingView.delegate = self
        self.navigationItem.hidesBackButton = false
    }
}




