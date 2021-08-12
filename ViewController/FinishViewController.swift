//
//  FinishViewController.swift
//  TodoApp1
//
//  Created by 上原太一 on 2021/08/12.
//

import UIKit

class FinishViewController: UIViewController {
    
    @IBOutlet weak var finishedTask: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    var index = Int()
    
    //タスク名を保持する変数
    var taskName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //taskをuserDefaultsと同期させる
        if UserDefaults.standard.object(forKey: "lark") != nil{
            task = UserDefaults.standard.object(forKey: "lark") as! [String]
        }

        //ラベルに文字を反映
        finishedTask.text = taskName
    }
    
    @IBAction func pushed(_ sender: Any) {
        task.remove(at: index)
        UserDefaults.standard.setValue(task, forKey: "lark")
        finishButton.isHidden = true
        
        let taskTableVC = self.storyboard?.instantiateViewController(identifier: "table") as! TaskTableViewController
        
        taskTableVC.valueOfTable = task
    }
    

}
