//
//  TasksViewControlle.swift
//  ToDoFire
//
//  Created by Николай Замараев on 04.01.2026.
//

import Foundation
import UIKit
import FirebaseAuth

final class TasksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Новая задача", message: "Введите название задачи", preferredStyle: .alert)
        
        alertController.addTextField()
        
        let save = UIAlertAction(title: "Сохранить", style: .default) { _ in
            guard let textField = alertController.textFields?.first, !textField.text!.isEmpty else { return }
            
            
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        alertController.addAction(save)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func signOutButtonTappped(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = .clear
        
        return cell
    }
}

extension TasksViewController: UITableViewDelegate {
    
}
