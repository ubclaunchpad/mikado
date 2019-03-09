//
//  DayCell.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {
    var date : String?
    var dayImage : UIImage?
    
    
    var dateView : UITextView  = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    var dayImageView : UIImageView = {
        var dayView = UIImageView()
        dayView.translatesAutoresizingMaskIntoConstraints = false
        return dayView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        dayPhoto.tintColor = UIColor.black
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(dayImageView)
        self.addSubview(dateView)
        
        dayImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dayImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dayImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dayImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        dateView.leftAnchor.constraint(equalTo: self.dayImageView.rightAnchor).isActive = true
        dateView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dateView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dateView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        //backgroundColor = .orange
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let date = date {
            dateView.text = date
        }
        if let image = dayImage {
            dayImageView.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
}
