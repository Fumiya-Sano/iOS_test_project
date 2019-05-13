//
//  ViewController.swift
//  MyTodoList
//
//  Created by 佐野文哉 on 2018/09/12.
//  Copyright © 2018年 myname. All rights reserved.
//

import UIKit

//UITableViewDataSource,UITableViewDelegateのプロトコルを実装する旨の宣言を行う
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //ToDoを格納した配列
    var todoList = [MyTodo]()
    


    @IBAction func tapAddButton(_ sender: Any) {
        //アラートダイアログを生成
        let alertController = UIAlertController(title: "ToDo追加",
                                                message: "ToDoを追加してください",
                                                preferredStyle: UIAlertControllerStyle.alert)
        //テキストエリアを追加
        alertController.addTextField(configurationHandler: nil)
        //OKボタンを追加
        let okAction = UIAlertAction(title: "OK",
                                     style: UIAlertActionStyle.default) {
                                        (action: UIAlertAction) in
                                        //Okボタンがタップされた時の処理
                                        if let textField = alertController.textFields?.first {
                                            //todoの配列に入力値を挿入　先頭に挿入する
                                            let myTodo = MyTodo()
                                            myTodo.todoTitle = textField.text!
                                            //ToDoの配列に入力値を挿入　先頭に挿入する
                                            self.todoList.insert(myTodo, at: 0)
                                            
                                            //テーブルに行が追加されたことをテーブルに通知
                                            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)],
                                                                      with: UITableViewRowAnimation.right)
                                            // Todoの保存処理
                                            let userDefaults = UserDefaults.standard
                                            //data型にシリアライズする
                                            let data = NSKeyedArchiver.archivedData(withRootObject: self.todoList)
                                            userDefaults.set(data, forKey: "todoList")
                                            userDefaults.synchronize()
                                        }
        }
        //OKボタンがタップされた時の処理
        alertController.addAction(okAction)
        
        //CANCELボタンがタップされた時の処理
        let cancelButton = UIAlertAction(title: "CANCEL",
                                    style: UIAlertActionStyle.cancel,
                                    handler: nil)
        alertController.addAction(cancelButton)
        
        //アラートダイアログを表示
        present(alertController, animated: true, completion: nil)
        
    }
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //保存しているtodoの読み込み
        let userDefaults = UserDefaults.standard
        if let storedTodoList = userDefaults.object(forKey: "todoList") as? Data {
            if let unarchiveTodoList = NSKeyedUnarchiver.unarchiveObject(with: storedTodoList) as? [MyTodo] {
            todoList.append(contentsOf: unarchiveTodoList)
            }
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルが編集可能かどうかを返却する
    func tableView(_ tableView: UITableView,
                   canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
  
    // テーブルの行数を返却する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Todoの配列の長さを返却する
        return todoList.count
    }
    
    //テーブルの行ごとのセルを返却する
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Storyboardで指定したtodocell識別子を利用して再利用可能なセルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell",
                                                 for: indexPath)
        //ぎょう番号にあったToDoのタイトルを取得
        let myTodo = todoList[indexPath.row]
        //セルのラベルにToDoのタイトルをセット
        cell.textLabel?.text = myTodo.todoTitle
        //セルのチェックマーク状態をセット
        if myTodo.todoDone {
            //チェックあり
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    //セルをタップした時の処理
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let myTodo = todoList[indexPath.row]
        if myTodo.todoDone {
            //完了済みの場合は未完了に変更
            myTodo.todoDone = false
        }else {
            //未完了の場合は完了に
            myTodo.todoDone = true
        }
        //セルの状態を変更
        tableView.reloadRows(at: [indexPath],
                             with: UITableViewRowAnimation.fade)
        //データ保存
        let data: Data = NSKeyedArchiver.archivedData(withRootObject: todoList)
        //userDefualtsに保存
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "todoList")
        userDefaults.synchronize
    }
    //セルを削除した時の処理
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        //削除処理かどうか
        if editingStyle == UITableViewCellEditingStyle.delete {
            //Todリストから削除
            todoList.remove(at: indexPath.row)
            //セルを削除
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            //データ保存
            let data: Data = NSKeyedArchiver.archivedData(withRootObject: todoList)
            //userdefaultsに保存
            let userDefaults = UserDefaults.standard
            userDefaults.set(data, forKey: "todoList")
            userDefaults.synchronize()
        }
    }


}


//独自クラスをシリアライズする際には、NSObjectを継承し
//NSCodingプロトコルに準拠する必要がある
class MyTodo: NSObject, NSCoding{
    //ToDoのタイトル
    var todoTitle: String?
    //ToDoを完了したかどうかを表すフラグ
    var todoDone: Bool = false
    // コンストラクト
    override init() {
        
    }
    //NSCodingプロトコルに宣言されているでシリアライズ処理
    required init?(coder aDecoder: NSCoder) {
        todoTitle = aDecoder.decodeObject(forKey: "todoTitle") as? String
        todoDone = aDecoder.decodeBool(forKey: "todoDone")
    }
    // NSCodingプロトコルに宣言されているシリアライズ処理
    func encode(with aCoder: NSCoder) {
        aCoder.encode(todoTitle, forKey: "todoTitle")
        aCoder.encode(todoDone, forKey: "todoDone")
    }
}
