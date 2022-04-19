//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Artur Skaliy on 13.04.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    var habit: Habit? {
        didSet {
            nameLabel.text = habit?.name
            nameLabel.textColor = habit?.color
            timeLabel.text = habit?.dateString
            checkButton.tintColor = habit?.color
            if habit!.isAlreadyTakenToday {
                checkButton.setImage(UIImage(systemName: "checkmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 36)), for: .normal)
            }
            else{
                checkButton.setImage(UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 36)), for: .normal)
            }
            countLabel.text = "Счетчик: \(habit!.trackDates.count)"
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cellStackView: UIStackView = {
       let cellStackView = UIStackView()
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.axis = .vertical
        cellStackView.spacing = 4
        return cellStackView
    }()
    
    func setup() {
        
        contentView.addSubview(cellStackView)
        cellStackView.addArrangedSubview(nameLabel)
        cellStackView.addArrangedSubview(timeLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(checkButton)
        
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -103),
            countLabel.topAnchor.constraint(equalTo: cellStackView.bottomAnchor, constant: 20),
            countLabel.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor),
            checkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 47),
            checkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            checkButton.widthAnchor.constraint(equalToConstant: 36),
            checkButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
     override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
