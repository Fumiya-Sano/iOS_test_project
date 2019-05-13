//
//  ViewController.swift
//  SingleDataStorage
//
//  Created by 佐野文哉 on 2018/09/12.
//  Copyright © 2018年 myname. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UserDefaultsの参照
        let userDefaults = UserDefaults.standard
        
        //textというキーを指定して保存していた値を取り出す
        if let value = userDefaults.string(forKey: "text") {
            //取り出した値をテキストフィールドに設定
            textField.text = value
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func tapActionButton(_ sender: Any) {
    //UserDefaultsの参照
        let userDefaults = UserDefaults.standard
        //textというキーで保存する
        userDefaults.set(textField.text, forKey: "text")
        //userdefaultsへの値の保存を明示的に行う
        userDefaults.synchronize()
    }
}

