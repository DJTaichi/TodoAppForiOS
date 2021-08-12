//
//  AddTaskViewController.swift
//  TodoApp1
//
//  Created by 上原太一 on 2021/08/12.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "lark") != nil{
            task = UserDefaults.standard.object(forKey: "lark") as! [String]
        }

    }
    
    @IBAction func button(_ sender: Any) {
        if textLabel.text != nil && textLabel.text != ""{
            task.append(textLabel.text!)
            
            //userdefaultsに保存
            UserDefaults.standard.setValue(task, forKey: "lark")
            
            //TaskTableViewControllerを宣言
            let tableVC = self.storyboard?.instantiateViewController(identifier: "table") as! TaskTableViewController
            
            //navigationControllerで遷移
            self.navigationController?.pushViewController(tableVC, animated: true)
        }
    }
    

}
