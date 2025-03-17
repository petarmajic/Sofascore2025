//
//  ViewController.swift
//  Sofascore2025App
//
//  Created by Petar Majić on 08.03.2025..
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
        self.view.backgroundColor = .red
        
        let viewBox = UIView()
        viewBox.backgroundColor = .green
        self.view.addSubview(viewBox)
        
        viewBox.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.width.height.equalTo(100)
        }
    }
}


