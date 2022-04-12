//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Artur Skaliy on 04.04.2022.
//

import UIKit

class InfoViewController: UIViewController, UITextViewDelegate {

    let infoScrollView: UIScrollView = {
    let infoScrollView = UIScrollView()
        infoScrollView.translatesAutoresizingMaskIntoConstraints = false
        infoScrollView.backgroundColor = .white
        return infoScrollView
    }()
    
    let titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.text = "Привычка за 21 день"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let textStackView: UIStackView = {
       let textStackView = UIStackView()
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.axis = .vertical
        textStackView.spacing = 12
        return textStackView
    }()
    
    let text: UILabel = {
       let text = UILabel()
        text.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        return text
    }()
    
    let text1: UILabel = {
       let text = UILabel()
        text.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        return text
    }()
    
    let text2: UILabel = {
       let text = UILabel()
        text.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        return text
    }()
    
    let text3: UILabel = {
       let text = UILabel()
        text.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        return text
    }()
    
    let text4: UILabel = {
       let text = UILabel()
        text.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        return text
    }()
    
    let text5: UILabel = {
       let text = UILabel()
        text.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        return text
    }()
    
    let text6: UILabel = {
       let text = UILabel()
        text.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, знает себя полностью обновившимся."
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        return text
    }()
    
    let footLabel: UILabel = {
       let text = UILabel()
        text.text = "Источник: psychbook.ru"
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        return text
    }()

    
    
    let contentView = UIView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Информация"
        view.backgroundColor = .white
        
        view.addSubview(infoScrollView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        infoScrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textStackView)
        
        textStackView.addArrangedSubview(text)
        textStackView.addArrangedSubview(text1)
        textStackView.addArrangedSubview(text2)
        textStackView.addArrangedSubview(text3)
        textStackView.addArrangedSubview(text4)
        textStackView.addArrangedSubview(text5)
        textStackView.addArrangedSubview(text6)
        
        contentView.addSubview(footLabel)

        NSLayoutConstraint.activate([
            infoScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            infoScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            infoScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: infoScrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: infoScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: infoScrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: infoScrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -141),
            
            textStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            textStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            footLabel.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 16),
            footLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            footLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -148),
            footLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22)
            
            
            
        ])
        
    }

}
