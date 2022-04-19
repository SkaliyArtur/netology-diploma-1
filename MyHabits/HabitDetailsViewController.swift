//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Artur Skaliy on 18.04.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CloseDelegate {
   
    var habit: Habit?
    var habitTitle = ""
    
    func closeView() {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitDetailsTableViewCell", for: indexPath) as! HabitDetailsTableViewCell
        
        cell.dateLabel.text = HabitsStore.shared.trackDateString(forIndex: indexPath.row)

        if HabitsStore.shared.habit(habit!, isTrackedIn: HabitsStore.shared.dates[indexPath.row]) {
            cell.accessoryType = .checkmark
            cell.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        }
        else {
            cell.accessoryType = .none
    }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 44
        }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Активность"
    }

    let tableView = UITableView.init(frame: .zero, style: .grouped)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 0.94)
        title = habitTitle
        navigationItem.largeTitleDisplayMode = .never

        navigationController?.navigationBar.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(edit))
        tableView.register(HabitDetailsTableViewCell.self, forCellReuseIdentifier: "HabitDetailsTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
    @objc func edit() {
        let havitVC = HabitViewController()
        havitVC.habit = habit
        havitVC.closeView = self
        let navigationController = UINavigationController(rootViewController: havitVC)
        present(navigationController, animated: true)
    }
    
}
