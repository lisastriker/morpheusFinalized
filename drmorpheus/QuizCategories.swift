//
//  QuizCategories.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 29/7/20.
//  Copyright © 2020 NUS Anaesthesia . All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class QuizCategories: UIViewController {
    var ref:DatabaseReference?
    var categoriesArray = [String]()
    var wordToSend : String = ""
    
    /*Sending info between segues*/
    @IBAction func AnaesthesiaQuiz(_ sender: Any) {
        wordToSend = "anaesthesia"
    }
    
    @IBAction func RespiratoryQuiz(_ sender: Any) {
        wordToSend = "respiratory"
    }
    
    @IBAction func CardiologyQuiz(_ sender: Any) {
        wordToSend = "cardiology"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /*Send word over segue*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Determine what the segue destination is
        if segue.destination is MCQuiz
        {
            let vc = segue.destination as? MCQuiz
            vc?.word = wordToSend
        }
    }
    
}
