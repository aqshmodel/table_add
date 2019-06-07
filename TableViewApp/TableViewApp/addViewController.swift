//
//  addViewController.swift
//  TableViewApp
//
//  Created by Takahiro Tsukada on 2019/06/06.
//  Copyright © 2019 Takahiro Tsukada. All rights reserved.
//

import UIKit

class addViewController: UIViewController, UITextFieldDelegate {
    
    let userDefaults = UserDefaults.standard
    var enterWords = [String]()
    // 最初の画面でタップした行の値を受け取る
    let keyWord = UserDefaults.standard.object(forKey: "judge")

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "\(keyWord!)") != nil {
            enterWords = UserDefaults.standard.object(forKey: "\(keyWord!)") as! [String]
        }
    }
    
    // テキストフィールドに文字入力
    @IBOutlet weak var enterText: UITextField!
    
    // 追加ボタンを押すと入力された文字を読み込み、値を保存
    @IBAction func addButton(_ sender: Any) {
            // テキストフィールドに入力された文字を配列に格納
            enterWords.append(enterText.text!)
            //  テキストフィールドの値を空に初期化する
            enterText.text = ""
        //  最初の画面でタップした行の値をキーとしてアプリ内に保存
        UserDefaults.standard.set(enterWords, forKey: "\(keyWord!)" )
        //  segueを使用せず、コードで前の画面に戻る
        self.navigationController?.popViewController(animated: true)
        }
    
}
