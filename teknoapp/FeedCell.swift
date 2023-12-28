//
//  FeedCell.swift
//  teknoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.12.2023.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var haberImageView: UIImageView!
    @IBOutlet weak var icerikLabel: UILabel!
    @IBOutlet weak var haberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
