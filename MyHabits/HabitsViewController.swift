//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Artur Skaliy on 04.04.2022.
//

import UIKit

class HabitsViewController: UIViewController, UINavigationBarDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, RefreshDelegate  {
    
    func refreshView() {
        habitsCV.reloadData()
    }
    
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .vertical
        return layout
    }()

    lazy var habitsCV: UICollectionView = {
        let collection  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HabitCollectionViewCell.self))
        collection.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ProgressCollectionViewCell.self))
        collection.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        return collection
    }()
    
    func setupCollectionView() {
        view.addSubview(habitsCV)
        NSLayoutConstraint.activate([
            habitsCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitsCV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitsCV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitsCV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return HabitsStore.shared.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProgressCollectionViewCell.self), for: indexPath) as? ProgressCollectionViewCell
            
            else {
            return UICollectionViewCell()
            }
            cell.progressBar.progress = HabitsStore.shared.todayProgress
            cell.percentLabel.text = "\(Int(round(cell.progressBar.progress * 100)))%"
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HabitCollectionViewCell.self), for: indexPath) as? HabitCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.habit = HabitsStore.shared.habits[indexPath.row]
           
            let checkGesture = UITapGestureRecognizer(target: self, action: #selector(checkProcess))
            cell.checkButton.addGestureRecognizer(checkGesture)
            return cell
        }
    }
    @objc func checkProcess(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: self.habitsCV)
        
        if let indexPath = self.habitsCV.indexPathForItem(at: location) {
        
        if HabitsStore.shared.habits[indexPath.row].isAlreadyTakenToday {
            print("Нельзя трекать привычку более одного раза в день")
        }
        else {
            let cell = habitsCV.cellForItem(at: habitsCV.indexPathForItem(at: sender.location(in: habitsCV))!) as! HabitCollectionViewCell
            cell.checkButton.setImage(UIImage(systemName: "checkmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 36)), for: .normal)
            HabitsStore.shared.track(HabitsStore.shared.habits[indexPath.row])
            habitsCV.reloadData()
            }
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width - 34, height: 60)
        }
        else {
        return CGSize(width: collectionView.frame.width - 34, height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 22, left: 16, bottom: 0, right: 17)
        }
        else
        {
            return UIEdgeInsets(top: 18, left: 16, bottom: 12, right: 17)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let habitDetailsVC = HabitDetailsViewController()
            habitDetailsVC.habit = HabitsStore.shared.habits[indexPath.row]
            habitDetailsVC.habitTitle = HabitsStore.shared.habits[indexPath.row].name
            navigationController?.pushViewController(habitDetailsVC, animated: true)
            
            
        }
    }
    
    func setupNavBar () {
        let navigationBar: UINavigationBar = {
            let navBar = UINavigationBar()
            navBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 140)
            navBar.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 0.94)
            return navBar
        }()
        
        navigationBar.delegate = self
        view.addSubview(navigationBar)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tap))
        navigationItem.rightBarButtonItem!.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        navigationItem.title = "Сегодня"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 0.94)
        
        setupNavBar()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        habitsCV.reloadData()
        habitsCV.setNeedsDisplay()
        
    }
    
    override func viewWillLayoutSubviews() {
        habitsCV.reloadData()
        habitsCV.setNeedsDisplay()
    }

    @objc func tap() {
        let habitCreateVC = HabitViewController()
        let navigationController = UINavigationController(rootViewController: habitCreateVC)
        habitCreateVC.refreshView = self
//        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
        
    }
}
