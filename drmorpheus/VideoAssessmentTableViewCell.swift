//
//  VideoAssessmentTableViewCell.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 17/2/20.
//  Copyright © 2020 NUS Anaesthesia . All rights reserved.
//

import Foundation
import UIKit
import WebKit

class VideoAssessmentTableViewCell :UITableViewCell{
    
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var videoName: UILabel!
    
    func setCell(currentLastItem : VideoInfo){
        videoName?.text = currentLastItem.name
    videoDescription?.text = currentLastItem.information

    }
}
