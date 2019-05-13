//
//  PercentViewController.swift
//  MyCluc
//
//  Created by 佐野文哉 on 2018/09/11.
//  Copyright © 2018年 myname. All rights reserved.
//

import UIKit

class PercentViewController: UIViewController {
    
    //金額を受け取るプロパティ
    var price: Int = 0

    @IBOutlet weak var percentFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   //計算するボタンがタップされて。次の画面に移送する際の前処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面を取り出す
        let viewController =  segue.destination as! ResultViewController
        //次の画面に現在保持している金額を設定
        viewController.price = price
        if let percent = Int(percentFiled.text!) {
            //次の画面に現在保持しているパーセンテージを設定する
            viewController.percent = percent
        }
       
    }
   

    
    @IBAction func tap1Button(_ sender: Any) {
        let value = percentFiled.text! + "1" //数字の１を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }
    @IBAction func tap2Button(_ sender: Any) {
        let value = percentFiled.text! + "2" //数字の2を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }
    @IBAction func tap3Button(_ sender: Any) {
        let value = percentFiled.text! + "3" //数字の3を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }
    @IBAction func tap4Button(_ sender: Any) {
        let value = percentFiled.text! + "4" //数字の4を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }
    @IBAction func tap5Button(_ sender: Any) {
        let value = percentFiled.text! + "5" //数字の5を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }
    
    @IBAction func tap6Button(_ sender: Any) {
        let value = percentFiled.text! + "6" //数字の6を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }
    @IBAction func tap7Button(_ sender: Any) {
        let value = percentFiled.text! + "7" //数字の7を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }

    @IBAction func tap8Button(_ sender: Any) {
        let value = percentFiled.text! + "8" //数字の8を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }
    @IBAction func tap9Button(_ sender: Any) {
        let value = percentFiled.text! + "9" //数字の9を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }
    @IBAction func tap0Button(_ sender: Any) {
        let value = percentFiled.text! + "0" //数字の0を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    
    }
    @IBAction func tap00Button(_ sender: Any) {
        let value = percentFiled.text! + "00" //数字の00を末尾に追加
        if let percent = Int(value) {
            percentFiled.text = "\(percent)"
        }
    }
    @IBAction func tapCButton(_ sender: Any) {
        percentFiled.text = "0"
    }
    
}
