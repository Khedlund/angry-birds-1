//
//  BirdCell.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 4/13/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class BirdCell: UITableViewCell {

    @IBOutlet weak var birdNameLabel: UILabel!
    @IBOutlet weak var birdDescriptionLael: UILabel!
    @IBOutlet weak var birdImageView: UIImageView!
    
    var bird: Bird? {
        didSet {
            self.birdNameLabel.text = bird?.name
            self.birdDescriptionLael.text = bird?.description
            self.accessoryType = bird!.confirmedSighting ? .checkmark : .none
            
            // Added default image
            // could also load an image into project, and use that for more reliability without internet
            var defaultImage = NSData(contentsOf: URL(string: "https://cdn.iconscout.com/icon/premium/png-256-thumb/website-not-found-3123513-2619679.png" )!)
            
            DispatchQueue.global(qos: .userInitiated).async {
                let birdImageData = NSData(contentsOf: URL(string: self.bird!.imageUrl)!)
                DispatchQueue.main.async {
                    
                    // Use default image here
                    self.birdImageView.image = UIImage(data: (birdImageData as? Data ?? defaultImage as! Data))
                    self.birdImageView.layer.cornerRadius = self.birdImageView.frame.width / 2
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
