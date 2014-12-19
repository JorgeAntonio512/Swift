//
//  DetailsViewController.swift
//  MusicPlayer
//
//  Created by Jameson Quave on 9/16/14.
//  Copyright (c) 2014 JQ Software LLC. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, APIControllerProtocol {
    lazy var api : APIController = APIController(delegate: self)
    
    @IBOutlet weak var tracksTableView: UITableView!
    var album: Album?
    var tracks = [Track]()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = self.album?.title
        albumCover.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.album!.largeImageURL)!)!)
        if self.album != nil {
            api.lookupAlbum(self.album!.collectionId)
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func didReceiveAPIResults(results: NSDictionary) {
        var resultsArr: NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.tracks = Track.tracksWithJSON(resultsArr)
            self.tracksTableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
}