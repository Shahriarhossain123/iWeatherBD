//
//  AlertCell.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class AlertCell: UITableViewCell {
    @IBOutlet weak var ContentSView: UIView!
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var ShowLabel: UILabel!
    @IBOutlet weak var SafeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ContentSView.layer.cornerRadius = 8
        ContentSView.layer.shadowColor = UIColor.darkGray.cgColor
        ContentSView.layer.shadowOpacity = 1
        ContentSView.layer.shadowOffset = .zero
        ContentSView.layer.shadowRadius = 5
        showImage.layer.cornerRadius = 8
        SafeButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
