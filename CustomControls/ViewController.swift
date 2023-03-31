//
//  ViewController.swift
//  CustomControls
//
//  Created by Hà Quang Hưng on 31/03/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customControlsUI: UICustomControls!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIButton(type: .custom)
        button1.setTitle("adkfsf", for: .normal)
        let button2 = UIButton(type: .custom)
        button2.setTitle("button2", for: .normal)
        let button3 = UIButton(type: .custom)
        button3.setTitle("button2", for: .normal)
        customControlsUI.backgroundColorCurrentButton = .black
        customControlsUI.buttons.append(button1)
        customControlsUI.buttons.append(button2)
        customControlsUI.buttons.append(button3)
    }


}

