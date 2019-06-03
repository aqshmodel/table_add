//
//  ViewController.swift
//  shoryuken
//
//  Created by Takahiro Tsukada on 2019/06/03.
//  Copyright © 2019 Takahiro Tsukada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 昇竜拳画像の格納配列
    var imageArray : Array<UIImage> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shoryuken.image = UIImage(named:"attak1") //初期画面用
        youWin.image = UIImage(named:"title")
        while let attackImage = UIImage(named: "attak\(imageArray.count+1)") {
            imageArray.append(attackImage)
        }
    }

    @IBOutlet weak var youWin: UIImageView!
    @IBOutlet weak var shoryuken: UIImageView!
    
    @IBAction func startButton(_ sender: UIButton) {
        // アニメーションの適用
        shoryuken.animationImages = imageArray
        // 0.2秒間隔
        shoryuken.animationDuration = 2
        // アニメーション再生回数
        shoryuken.animationRepeatCount = 1
        // アニメーションを開始
        shoryuken.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //2秒後に実行したい処理   勝利宣言
            self.youWin.image = UIImage(named:"youwin")
        }
    }
    
}

