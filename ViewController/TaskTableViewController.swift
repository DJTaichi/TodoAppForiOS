//
//  TaskTableViewController.swift
//  TodoApp1
//
//  Created by 上原太一 on 2021/08/12.
//

import UIKit

class TaskTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTable: UITableView!
    
    var valueOfTable : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTable.delegate = self
        taskTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //super.viewWillAppear(true)
        
        if UserDefaults.standard.object(forKey: "lark") != nil{
            valueOfTable = UserDefaults.standard.object(forKey: "lark") as! [String]
        }
        taskTable.reloadData()
        print(valueOfTable.count)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valueOfTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label = cell.contentView.viewWithTag(1) as! UILabel
        
        label.text = valueOfTable[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セルがタップされた時の挙動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let FinishVC = self.storyboard?.instantiateViewController(identifier: "finish") as! FinishViewController
        
        //タスクを渡す
        FinishVC.taskName = valueOfTable[indexPath.row]
        FinishVC.index = indexPath.row
        
        //画面遷移
        self.navigationController?.pushViewController(FinishVC, animated: true)
    }
    
}
