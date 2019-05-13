//
//  ViewController.swift
//  MyCluc
//
//  Created by 佐野文哉 on 2018/09/11.
//  Copyright © 2018年 myname. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender : Any?) {
        //次の画面を取り出す
        let viewController = segue.destination as! PercentViewController
        
        //金額フィールドの文字列を数値に変換
        if let price = Int(priceField.text!) {
            //数値に変換した後の金額を次の画面に設定
            viewController.price = price
        }
    }
    
    //最後の画面から戻ってきた時の処理
    @IBAction func restart(_ segue: UIStoryboardSegue) {
        priceField.text = "0" //金額フィールドを０でリセット
    }
//ボタンをタップした時の処理
    @IBAction func tap1Button(_ sender: Any) {
        let value = priceField.text! + "1" //数字の１を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    @IBAction func tap2Button(_ sender: Any) {
        let value = priceField.text! + "2" //数字の2を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    @IBAction func tap3Button(_ sender: Any) {
        let value = priceField.text! + "3" //数字の3を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    @IBAction func tap4Button(_ sender: Any) {
        let value = priceField.text! + "4" //数字の4を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    @IBAction func tap5Button(_ sender: Any) {
        let value = priceField.text! + "5" //数字の5を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    
    @IBAction func tap6Button(_ sender: Any) {
        let value = priceField.text! + "6" //数字の6を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    @IBAction func tap7Button(_ sender: Any) {
        let value = priceField.text! + "7" //数字の7を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    @IBAction func tap8Button(_ sender: Any) {
        let value = priceField.text! + "8" //数字の8を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    @IBAction func tap9Button(_ sender: Any) {
        let value = priceField.text! + "9" //数字の9を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    @IBAction func tap0Button(_ sender: Any) {
        let value = priceField.text! + "0" //数字の0を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
        }
    }
    @IBAction func tap00Button(_ sender: Any) {
        let value = priceField.text! + "00" //数字の0を末尾に追加する
        if let price = Int(value) {        //文字列型の数字を数値型に変換する 変換することで先頭の0を消去
            priceField.text = "\(price)"   //価格フィールドに数値を反映
            }
    }
    //Cボタンをタップした時の処理
    @IBAction func tapCbutton(_ sender: Any) {
        priceField.text = "0"
    }
    
    
}
