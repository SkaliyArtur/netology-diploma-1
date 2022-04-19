//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Artur Skaliy on 13.04.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {

    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.text = "Всё получится!"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.text = "0%"
        label.textAlignment = .right
        return label
    }()
    
    let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressTintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        progressBar.progress = 0.0
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = 3.5

        return progressBar
    }()
    
    override init(frame: CGRect) {
       super.init(frame: .zero)
       
       contentView.layer.cornerRadius = 8
       contentView.clipsToBounds = true
       contentView.backgroundColor = .white
        contentView.addSubview(progressLabel)
        contentView.addSubview(percentLabel)
        contentView.addSubview(progressBar)

        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -115),
            progressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            percentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            percentLabel.leadingAnchor.constraint(equalTo: progressLabel.trailingAnchor, constant: 8),
            percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            percentLabel.bottomAnchor.constraint(equalTo: progressLabel.bottomAnchor),
            progressBar.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
            progressBar.leadingAnchor.constraint(equalTo: progressLabel.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: percentLabel.trailingAnchor),
            progressBar.widthAnchor.constraint(equalToConstant: 319),
            progressBar.heightAnchor.constraint(equalToConstant: 7)
        ])
       
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    
}
