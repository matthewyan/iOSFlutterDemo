//
//  ViewController.swift
//  iOSFlutterDemo
//
//  Created by 闫猛 on 2018/10/24.
//  Copyright © 2018年 闫猛. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    var btn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 150, width: UIScreen.main.bounds.width - 100, height: 50)
        btn.backgroundColor = UIColor.lightGray
        btn.setTitle("进入flutter页面", for: .normal)
        self.view.addSubview(btn)

        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
    }

    @objc func btnClick() {
        let vc = FlutterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

