//
//  DrugDosingScreen.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 25/11/19.
//  Copyright © 2019 NUS Anaesthesia . All rights reserved.
//

import UIKit

class DrugDosingScreen: UIViewController {
    
    @IBOutlet weak var patientWeight: UITextField!
    @IBOutlet weak var drugInfo:UILabel!

    
    @IBOutlet weak var patientAge: UITextField!
    @IBOutlet weak var ETTSize: UILabel!
    
     
     // @IBOutlet weak var genderButton: UIButton!
    // var isChecked=true
     
    @IBOutlet weak var genderButton: UIButton!{
         didSet{
             genderButton.layer.cornerRadius = 3
             genderButton.layer.borderWidth = 1
         
         }
     }
     var isChecked=false
    
    @IBAction func genderButtonFunction(_ sender: UIButton) {
          let patientAgeInt:Int? = Int(patientAge.text!)
         isChecked = !isChecked
         if isChecked{
             sender.setTitle("male", for :.normal)
             sender.setTitleColor(.blue, for:.normal)
             sender.setImage(UIImage(named:"male"), for: .normal)
             sender.tintColor = .blue
             sender.contentVerticalAlignment = .fill
             sender.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            switch patientAgeInt {
            case nil:
                 ETTSize.text = "Please enter age in numerical value"
            case 1:
                ETTSize.text = "Use ETT size 4 for asian male"
            case 2:
                ETTSize.text = "Use ETT size 5 for asian male"
            case 3,4,5:
                ETTSize.text = "Use ETT size 5 or 5.5 for asian male"
            case 6:
                ETTSize.text = "Use ETT size 6 for asian male"
            case 7,8,9,10,11:
                ETTSize.text = "Use ETT size 6 or 6.5 for asian male"
            case 12:
                ETTSize.text = "Use ETT size 7 for asian male"
            default:
                ETTSize.text = "Use ETT size 8 or 8.5 for asian male"
            }
            }
            
          else {
             sender.setTitle("female", for: .normal)
             sender.setTitleColor(.red, for:.normal)
             sender.setImage(UIImage(named: "female"), for: .highlighted)
             sender.tintColor = .red
             sender.contentVerticalAlignment = .fill
             sender.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
             switch patientAgeInt{
             case nil:
                  ETTSize.text = "Please enter age in numerical value"
             case 1:
                 ETTSize.text = "Use ETT size 4 for asian female"
             case 2:
                 ETTSize.text = "Use ETT size 5 for asian female"
             case 3,4,5:
                 ETTSize.text = "Use ETT size 5 or 5.5 for asian female"
             case 6:
                 ETTSize.text = "Use ETT size 6 for asian female"
             case 7,8,9,10,11:
                 ETTSize.text = "Use ETT size 6 or 6.5 for asian female"
             case 12:
                 ETTSize.text = "Use ETT size 7 for asian female"
             default:
                 ETTSize.text = "Use ETT size 7 or 7.5 for asian female"
             }
         }
     }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
   
      
    }

    
    @IBAction func Calculate(_ sender: Any) {
        var patientWeightString : String = String(patientWeight.text!)
        var patientWeightTrim = patientWeightString.trimmingCharacters(in: .whitespaces)
        
        
        
        var patientWeightInt:Double! = Double(patientWeightTrim)
        if (patientWeightInt is Double){
            let propofol:Double = Double(patientWeightInt!*2.5)
            let atracium:Double = Double(patientWeightInt!/2.5)
            let fentanyl:Double = Double(patientWeightInt!*2.5)
            drugInfo.text = "Please anaesthesize with \(propofol)mg propofol, \(atracium)mg Atracium, \(fentanyl)mcg fentanyl"
        }
        else{
            drugInfo.text="Please input a number."
        }
         
    }
    


    
    
    
}
