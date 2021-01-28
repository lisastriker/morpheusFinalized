//
//  VIdeo.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 6/12/19.
//  Copyright © 2019 NUS Anaesthesia . All rights reserved.
//

import Foundation
import UIKit
import WebKit

class Video: UIViewController, UITableViewDelegate, UITableViewDataSource, WKUIDelegate{

    @IBOutlet weak var IntubationTab: UIButton!{
    didSet{

        IntubationTab.layer.cornerRadius = 10
            IntubationTab.layer.borderWidth = 1
            IntubationTab.layer.borderColor = UIColor.gray.cgColor
        
        }
    }
    @IBOutlet weak var AssessmentTab: UIButton!{
               didSet{
                   AssessmentTab.layer.cornerRadius = 10
                       AssessmentTab.layer.borderWidth = 1
                   AssessmentTab.layer.borderColor = UIColor.gray.cgColor
                   
        }
    }
    
    @IBOutlet weak var AirwayTab: UIButton!{
        didSet{
            AirwayTab.layer.cornerRadius = 10
                AirwayTab.layer.borderWidth = 1
                AirwayTab.layer.borderColor = UIColor.gray.cgColor
            
            
        }
    }
   
            

    
    @IBOutlet weak var tableView: UITableView!
    var objectVideo : [VideoInfo] = []

    
  
    @IBAction func backHome(_ sender: Any) {
            self.performSegue(withIdentifier: "backHomeSegue", sender: self)
    }
    
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
       objectVideo = createArray()
/*self.tableView.register(VideoTableViewCell.self, forCellReuseIdentifier:"cell")*/ //this makes code disappear
        tableView.delegate = self
        tableView.dataSource = self
      
        
    }
    
    func createArray() -> [VideoInfo]{
        let video1 = VideoInfo(name:"Lesson 1", information: "Airway Evaluation", videoKey:"AmjKtpcDRJc")
        let video2 = VideoInfo(name: "Lesson 2", information: "Preparing for intubation", videoKey :"35DLzBh6cuk")
        let video3 = VideoInfo(name: "Lesson 3", information: "Mask Ventilation", videoKey: "1goz1l28kUQ")
    return [video1, video2, video3]
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectVideo.count /*when changed to videoInfo count doesn't work*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let currentLastItem = objectVideo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        cell.videoName.text = currentLastItem.name
        cell.videoDescription.text = currentLastItem.information
        let objectVideoKey = currentLastItem.videoKey
        let youtubeURL=URL(string: "https://www.youtube.com/embed/\(objectVideoKey)")
        cell.myWebView.load(URLRequest(url: youtubeURL!))
        return cell
        
        
        /*cell.setCell(currentLastItem: currentLastItem)
       */
        
    }
    /*func loadYoutube(videoKey : String){
    guard let youtubeURL=URL(string: "http://www.youtube.com.embed/\(objectVideoKey)") else { return }
    cell.myWebView.load(URLRequest(url: youtubeURL))*/
   
    
    
    
    }










        /*cell.videoName?.text = currentLastItem.name
    cell.videoDescription?.text=currentLastItem.information
        return cell
      
    }
    
}*/
    

    
 
