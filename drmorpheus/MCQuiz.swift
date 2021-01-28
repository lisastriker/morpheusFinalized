//
//  MCQuiz.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 27/7/20.
//  Copyright © 2020 NUS Anaesthesia . All rights reserved.
//
import Foundation
import UIKit
import FirebaseDatabase
import Alamofire
import AlamofireImage

struct Question{
    var questions : String!
    var options : [String]!
    var answer : String!
}


class MCQuiz: UIViewController {
    var databaseHandle:DatabaseHandle = 0
    var ref:DatabaseReference?
    var keyArray = [String]()
    var Questions = Question()
    var Qnumber : Int = 0
    var word: String = ""
    


    
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var startQuizButton: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    @IBOutlet weak var CheckAnswer: UILabel!
    @IBOutlet weak var QLabelView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        //Take all the keys
        
       ref?.child("chapter").child("\(word)").observeSingleEvent(of: .value, with: { (snapshot) in
       if snapshot.exists(){
             for child in snapshot.children {
               let snap = child as! DataSnapshot
               let key = snap.key
               self.keyArray.append(key)
               print(self.keyArray)
               }
           }
       })
       QLabel.isHidden = true
       Button1.isHidden = true
       Button2.isHidden = true
       Button3.isHidden = true
       Button4.isHidden = true
        CheckAnswer.isHidden = true
        QLabelView.isHidden = true
       nextQuestionButton.isHidden = true
       QLabelView.layer.borderWidth = 5.0
       QLabelView.layer.borderColor = UIColor.black.cgColor
        pictureImage.isHidden = true

        
    }
    
    
    @IBAction func onClickStart(_ sender: Any) {
        startQuiz()
    }
    
    //Button 1 press check for answer
    @IBAction func Button1pressed(_ sender: Any) {
        if(Questions.options[0] == Questions.answer){
            CheckAnswer.text = "Correct"
            CheckAnswer.backgroundColor = UIColor.green
        }
        else{
            CheckAnswer.text = "Wrong"
            CheckAnswer.backgroundColor = UIColor.red
        }
    }
    //Button 2 press check for answer
    @IBAction func Button2pressed(_ sender: Any) {
        if(Questions.options[1] == Questions.answer){
            CheckAnswer.text = "Correct"
            CheckAnswer.backgroundColor = UIColor.green
        }
        else{
            CheckAnswer.text = "Wrong"
            CheckAnswer.backgroundColor = UIColor.red
        }
    }
    //Button 3 press check for answer
    @IBAction func Button3pressed(_ sender: Any) {
        if(Questions.options[2] == Questions.answer){
            CheckAnswer.text = "Correct"
            CheckAnswer.backgroundColor = UIColor.green
        }
        else{
            CheckAnswer.text = "Wrong"
            CheckAnswer.backgroundColor = UIColor.red
        }
    }
     //Button 4 press check for answer
    @IBAction func Button4pressed(_ sender: Any) {
        if(Questions.options[3] == Questions.answer){
            CheckAnswer.text = "Correct"
            CheckAnswer.backgroundColor = UIColor.green
        }
        else{
            CheckAnswer.text = "Wrong"
            CheckAnswer.backgroundColor = UIColor.red
        }
    }
    
    func startQuiz(){
        if Qnumber < keyArray.count {
            
            var optionsArray = [String]()
           
           
           /*Get each option for MCQ*/ ref?.child("chapter").child("\(word)/\(keyArray[Qnumber])").observeSingleEvent(of: .value, with: { (snapshot) in
                if snapshot.exists(){
                    let dict = snapshot.value as! [String:Any]
                    let questionFirebase = dict["questionText"] as! String
                    let answerFirebase = dict["correctAnswer"] as! String
                    let pictureFirebase = dict["picture"] as! String
                    
                    if pictureFirebase.isEmpty {
                        print("no image")}
                        else {
                        
                        let url = URL(string: pictureFirebase)!
                        print(pictureFirebase)
                        self.pictureImage.af.setImage(withURL: url)
                        }
    
                    /*For 4 options*/
                    for i in 1...4{
                    let optionsFirebase = dict["option\(i)"] as! String
                    optionsArray.append(optionsFirebase)
                     }
                    self.Questions = Question(
                        questions : questionFirebase,
                        options : optionsArray,
                        answer : answerFirebase
                    )
            
                    self.QLabel.text = self.Questions.questions
                    
                    self.Button1.setTitle(self.Questions.options[0], for: .normal)
                    self.Button2.setTitle(self.Questions.options[1], for: .normal)
                    self.Button3.setTitle(self.Questions.options[2], for: .normal)
                    self.Button4.setTitle(self.Questions.options[3], for: .normal)
                    print(optionsArray);
                    self.startQuizButton.isHidden = true
                    self.CheckAnswer.isHidden = false
                    self.QLabel.isHidden = false
                    self.Button1.isHidden = false
                    self.Button2.isHidden = false
                    self.Button3.isHidden = false
                    self.Button4.isHidden = false
                    self.QLabelView.isHidden = false
                    self.nextQuestionButton.isHidden = false
                    self.pictureImage.isHidden = false
                    
                 }
            })
            
        }
        else{
            print("finish")
        }
    }
    
    /*Refresh quiz questions*/
    @IBAction func nextQuestion(_ sender: Any) {
        Qnumber += 1
        startQuiz()
    }
    
    
}

/* Whole list ref?.child("anaesthesia").observeSingleEvent(of: .value, with: { (snapshot) in
      if snapshot.exists(){
            for child in snapshot.children {
              let snap = child as! DataSnapshot
              let key = snap.key
              let dict = snap.value as! [String:Any]
              let myQuestion = dict["questionText"] as! String
              
              //printing options but it extends across
              for n in 1...4{ self.optionsArray.append(dict["option\(n)"] as! String);
                  print(self.optionsArray)
              }
              //append questiontext to array
              self.postData.append(myQuestion);
              print(key)
              print(dict)
              
          }
      
      }}) */
