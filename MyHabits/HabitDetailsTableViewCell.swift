//
//  HabitDetailsTableViewCell.swift
//  MyHabits
//
//  Created by Artur Skaliy on 18.04.2022.
//

import UIKit

class HabitDetailsTableViewCell: UITableViewCell {
    
    let dateLabel: UILabel = {
       let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return dateLabel
    }()
    
    private let doneImage: UIImageView = {
        let label = UIImageView()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(dateLabel)
        contentView.addSubview(doneImage)
        
        NSLayoutConstraint.activate([
        
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            
            doneImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            doneImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            doneImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
