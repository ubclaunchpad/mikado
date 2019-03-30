//
//  TripCell.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//
import UIKit

class TripCell: UITableViewCell {

    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var tripName: UILabel!
    let coverLayer = CALayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.clipsToBounds = true
        // Configure UILabel
        tripName.textColor = .white
        tripName.font = UIFont.systemFont(ofSize: 20.0)
        // Configure UIImageView to dim the image
//        cityImage.layer.opacity = 0.9
//        coverLayer.backgroundColor = UIColor.black.cgColor
//        coverLayer.opacity = 0.5
//        cityImage.layer.addSublayer(coverLayer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
}
