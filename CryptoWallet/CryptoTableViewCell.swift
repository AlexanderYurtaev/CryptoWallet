//
//  CryptoTableViewCell.swift
//  CryptoWallet
//
//  Created by Юртаев Александр on 20.05.2018.
//  Copyright © 2018 Юртаев Александр. All rights reserved.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    @IBOutlet weak var cryptoImage: UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
