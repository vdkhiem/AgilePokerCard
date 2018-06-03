//
//  SelectedCardViewController.swift
//  AgilePokerCard
//
//  Created by Vo Duy Khiem on 3/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import UIKit

class SelectedCardViewController: UIViewController {
    var textPassedOver: String?
    
    @IBOutlet weak var selectedCardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = textPassedOver {
            if (title == "Cof") {
                let imageName = "Coffee"
                let image = UIImage(named: imageName)
                selectedCardButton.setBackgroundImage(image, for: UIControlState.normal)
                selectedCardButton.setTitle("", for: UIControlState.normal)
            } else {
                selectedCardButton.setTitle(title, for: UIControlState.normal)
            }
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
