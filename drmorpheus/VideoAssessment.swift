//
//  VideoAssessment.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 17/2/20.
//  Copyright © 2020 NUS Anaesthesia . All rights reserved.
//

import Foundation
import UIKit
import WebKit

class VideoAssessment : UIViewController, UITableViewDelegate, UITableViewDataSource, WKUIDelegate{
    

    @IBAction func openAssessmentButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "assessmentSegue", sender: self)
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    var objectVideo : [VideoInfo] = []
    
    override func viewDidLoad() {
    super.viewDidLoad()

            objectVideo = createArray()
            tableView.delegate = self
            tableView.dataSource = self



    }
    func createArray() -> [VideoInfo]{
        let video1 = VideoInfo(name: "Lesson 2", information: "Airway Assessment", videoKey :"RIISAFeJRBY")
        let video2 = VideoInfo(name: "Lesson 2", information: "Checking airway for obstruction", videoKey :"02vIPxuLQ5c")
        let video3 = VideoInfo(name: "Lesson 3", information: "Mask Ventilation", videoKey: "1goz1l28kUQ")
    return [video1, video2, video3]
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectVideo.count /*when changed to videoInfo count doesn't work*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
           let currentLastItem = objectVideo[indexPath.row]
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoAssessmentTableViewCell
           cell.videoName.text = currentLastItem.name
           cell.videoDescription.text = currentLastItem.information
           let objectVideoKey = currentLastItem.videoKey
           let youtubeURL=URL(string: "https://www.youtube.com/embed/\(objectVideoKey)")
           cell.myWebView.load(URLRequest(url: youtubeURL!))
           return cell
    }

}
