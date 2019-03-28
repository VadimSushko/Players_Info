//
//  ViewController.swift
//  Players_Info
//
//  Created by Vadym Sushko on 3/26/19.
//  Copyright © 2019 Vadym Sushko. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var getButton: UIButton! {
        didSet {
            getButton.layer.borderWidth = 2
            getButton.layer.cornerRadius = 10
            getButton.layer.borderColor = #colorLiteral(red: 0.1259311959, green: 0.5914102157, blue: 0.1991669708, alpha: 1)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

