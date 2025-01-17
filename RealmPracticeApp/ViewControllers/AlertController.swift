//
//  AlertController.swift
//  RealmPracticeApp
//
//  Created by Виталий Подшибякин on 29.08.2024.
//

import UIKit

class AlertController: UIAlertController {
    var doneButton = "Save"
    
    static func createAlert(withTitle title: String, andMessage message: String) -> AlertController {
        AlertController(title: title, message: message, preferredStyle: .alert)
    }
        
    func action(with taskList: TaskList?, completion: @escaping (String) -> Void) {
        if taskList != nil { doneButton = "Update" }
                
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newValue = self.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
            completion(newValue)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.placeholder = "List Name"
            textField.text = taskList?.name
        }
    }
    
    func actionForTask(with task: Task?, completion: @escaping (String, String) -> Void) {
        if task != nil { doneButton = "Update" }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newTask = self.textFields?.first?.text else { return }
            guard !newTask.isEmpty else { return }
            
            if let newNote = self.textFields?.last?.text, !newNote.isEmpty {
                completion(newTask, newNote)
            } else {
                completion(newTask, "")
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.placeholder = "Task Name"
            textField.text = task?.name
        }
        
        addTextField { textField in
            textField.placeholder = "Note Name"
            textField.text = task?.note
        }
    }
    
    func action(completion: @escaping (String, String) -> Void) {
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newTask = self.textFields?.first?.text else { return }
            guard !newTask.isEmpty else { return }
            
            if let note = self.textFields?.last?.text, !note.isEmpty {
                completion(newTask, note)
            } else {
                completion(newTask, "")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        
        addTextField { textField in
            textField.placeholder = "New task"
        }
        
        addTextField { textField in
            textField.placeholder = "Note"
        }
    }
}

