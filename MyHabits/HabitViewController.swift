//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Artur Skaliy on 12.04.2022.
//

import UIKit

class HabitViewController: UIViewController, UIColorPickerViewControllerDelegate {

    let nameLabel: UILabel = {
       let nameLabel = UILabel()
        nameLabel.text = "НАЗВАНИЕ"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let nameTextField: UITextField = {
       let nameTextField = UITextField()
        nameTextField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameTextField.textColor = .black
        return nameTextField
        
    }()
    let colorLabel: UILabel = {
       let colorLabel = UILabel()
        colorLabel.text = "ЦВЕТ"
        colorLabel.textColor = .black
        colorLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        return colorLabel
    }()
    
    let pickerButton: UIButton = {
        let pickerButton = UIButton()
        pickerButton.layer.backgroundColor = UIColor(red: 1, green: 0.624, blue: 0.31, alpha: 1).cgColor
        pickerButton.layer.cornerRadius = 15
        pickerButton.translatesAutoresizingMaskIntoConstraints = false
        pickerButton.addTarget(self, action: #selector(picker), for: .touchUpInside)
        return pickerButton
    }()
    
    @objc func picker() {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        picker.selectedColor = pickerButton.backgroundColor!
        present(picker, animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        pickerButton.backgroundColor = viewController.selectedColor
    }
    
    let timeLabel: UILabel = {
       let timeLabel = UILabel()
        timeLabel.text = "ВРЕМЯ"
        timeLabel.textColor = .black
        timeLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()
    
    let timePickerLabel: UILabel = {
       let timePickerLabel = UILabel()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let currentDate: String = dateFormatter.string(from: Date())
        timePickerLabel.text = "Каждый день в \(currentDate)"
        timePickerLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        timePickerLabel.translatesAutoresizingMaskIntoConstraints = false
    
        return timePickerLabel
    }()
    
    let timePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.addTarget(self, action: #selector(timePickerChoosen), for: .valueChanged)
        return datePicker
    }()
    
    @objc func timePickerChoosen(_ sender: UIDatePicker) {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        timePickerLabel.text = "Каждый день в \(selectedDate)"
    }
    
    @objc func dismissHabitVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func saveHabit() {
        let newHabit = Habit(name: nameTextField.text!,
                             date: timePicker.date,
                             color: pickerButton.backgroundColor!)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        self.dismiss(animated: true, completion: nil)
        print(store.habits)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(colorLabel)
        view.addSubview(pickerButton)
        view.addSubview(timeLabel)
        view.addSubview(timePickerLabel)
        view.addSubview(timePicker)
        
        
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(dismissHabitVC))
        navigationItem.leftBarButtonItem!.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveHabit))
        navigationItem.rightBarButtonItem!.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        navigationItem.title = "Создать"
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -285),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -65),
            
            colorLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            colorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -323),
            
            pickerButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7),
            pickerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pickerButton.widthAnchor.constraint(equalToConstant: 30),
            pickerButton.heightAnchor.constraint(equalToConstant: 30),
            
            timeLabel.topAnchor.constraint(equalTo: pickerButton.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            timePickerLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            timePickerLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            timePicker.topAnchor.constraint(equalTo: timePickerLabel.bottomAnchor, constant: 15),
            timePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            timePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
            
            
            
        ])
        

    }
}
