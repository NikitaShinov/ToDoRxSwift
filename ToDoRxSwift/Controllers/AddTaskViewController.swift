//
//  AddTaskViewController.swift
//  ToDoRxSwift
//
//  Created by max on 29.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

class AddTaskViewController: UIViewController {
    
    private let taskSubject = PublishSubject<Task>()
    
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var taskTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func save() {
        
        guard let priority = Priority(rawValue: prioritySegmentedControl.selectedSegmentIndex), let taskText = taskTextField.text else { return }
        
        let task = Task(title: taskText, priority: priority)
        taskSubject.onNext(task)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
