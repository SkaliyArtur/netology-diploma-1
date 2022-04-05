//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Artur Skaliy on 04.04.2022.
//

import UIKit

class HabitsViewController: UIViewController, UINavigationBarDelegate {

    
    
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
        
        view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 0.94)
        
        setupNavBar()
    }
    @objc func tap() {
//        let infoVC = InfoViewController()
//        self.present(infoVC, animated: true, completion: nil)
        print("Hello")
    }
}
