//
//  ViewController.swift
//  VideoPlayerLocally
//
//  Created by siddharth on 01/02/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var stringpassed = ""
    var videoFiles = ["Jonas Blue - Mama ft. William Singe","Xcode Playgrounds - Prototyping UI - Swift"]
    var player: AVPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
}

extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoFiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = videoFiles[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        stringpassed = videoFiles[indexPath.row]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! VideoViewController
        dest.index = stringpassed
    }
}

