//
//  ColorDetailVC.swift
//  ios_color_app
//
//  Created by Johnson Chen on 13/12/2022.
//

import UIKit

class ColorDetailVC: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .systemPink
    }

}
