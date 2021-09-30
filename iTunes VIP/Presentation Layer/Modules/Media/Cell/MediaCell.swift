//
//  MediaCell.swift
//  iTunes VIP
//
//  Created by hashem on 26/09/2021.
//

import UIKit

class MediaCell: UITableViewCell {

    @IBOutlet weak var mediaLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            checkImage.isHidden = false
        }else{
            checkImage.isHidden = true
        }


    }
    
}
