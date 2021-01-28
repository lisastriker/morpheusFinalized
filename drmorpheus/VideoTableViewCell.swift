//
//  VideoTableViewCell.swift
//  drmorpheus
//
//  Created by NUS Anaesthesia  on 6/12/19.
//  Copyright © 2019 NUS Anaesthesia . All rights reserved.
//

import UIKit
import WebKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoName: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    
    @IBOutlet weak var myWebView: WKWebView!


    
    func setCell(currentLastItem : VideoInfo){
        videoName?.text = currentLastItem.name
    videoDescription?.text = currentLastItem.information

    }
    
    
}
