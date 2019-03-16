//
//  DayCell.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {
    @IBOutlet weak var DayImageView: UIImageView!
    @IBOutlet weak var DayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    func setDayCell(_ data: DayCellData) {
        DayImageView.image = data.image
        DayLabel.text = data.date
        DayLabel.layer.opacity = 0.9
        
        // dim the image
        let coverLayer = CALayer()
        coverLayer.frame = self.bounds;
        coverLayer.backgroundColor = UIColor.black.cgColor
        coverLayer.opacity = 0.5
        DayLabel.layer.addSublayer(coverLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
