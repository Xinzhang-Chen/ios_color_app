//
//  ColorsTableVCViewController.swift
//  ios_color_app
//
//  Created by Johnson Chen on 13/12/2022.
//

import UIKit

class ColorsTableVCViewController: UIViewController  {
    
    var listOfColors: [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupColors()
    }
    
    func setupColors() {
        for _ in 0..<50 {
            listOfColors.append(generateColor())
        }
    }
    
    func generateColor() -> UIColor {
        let color = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorDetailVC
        destVC.color = sender as? UIColor
    }
    
}

extension ColorsTableVCViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let newCell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        let color = listOfColors[indexPath.row]
        newCell.backgroundColor = color
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = listOfColors[indexPath.row]
        performSegue(withIdentifier: "ToColorDetailVC", sender: color)
    }
}
