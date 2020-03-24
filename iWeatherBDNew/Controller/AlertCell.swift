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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var FromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabelDateleLabel: UILabel!
    @IBOutlet weak var toLabelDateleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ContentSView.layer.cornerRadius = 8
        ContentSView.layer.shadowColor = UIColor.darkGray.cgColor
        ContentSView.layer.shadowOpacity = 2
        ContentSView.layer.shadowOffset = .zero
        ContentSView.layer.shadowRadius = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill( _ notice:Notice) {
        titleLabel.text = notice.title ?? ""
        descriptionLabel.text = notice.description ?? ""
        FromLabel.text = "From: \(notice.fromdate ?? "")"
        toLabel.text = "To: \(notice.todate ?? "")"
    }

}
