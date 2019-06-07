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
    let keyWord = UserDefaults.standard.object(forKey: "judge")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UserDefaults.standard.object(forKey: "\(keyWord!)") != nil {
            enterWords = UserDefaults.standard.object(forKey: "\(keyWord!)") as! [String]
        }
    }
    
    // テキストフィールドに文字入力
    @IBOutlet weak var enterText: UITextField!
    
    // 追加ボタンを押すと入力された文字を読み込み、値を保存
    @IBAction func addButton(_ sender: Any) {
            enterWords.append(enterText.text!)
            enterText.text = ""
        UserDefaults.standard.set(enterWords, forKey: "\(keyWord!)" )
        self.navigationController?.popViewController(animated: true)
        }
    
}
