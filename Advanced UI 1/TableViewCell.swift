//
//  TableViewCell.swift
//  Advanced UI 1
//
//  Created by Nakama on 09/11/18.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.backgroundColor = selected ? .red : .clear
    }
    
}
