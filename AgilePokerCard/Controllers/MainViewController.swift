//
//  ViewController.swift
//  AgilePokerCard
//
//  Created by Vo Duy Khiem on 3/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    var selectedCard = UIButton()
    var dataCoreManager = CoreDataManager(appDelegate: UIApplication.shared.delegate as! AppDelegate, entityName: "CardType")
    
    @IBOutlet weak var pokerView: UIView!
    @IBOutlet weak var estimationTupeSegmentControl: UISegmentedControl!
    @IBOutlet weak var tshirtView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //UIApplication.shared.statusBarView? = UIColor.white
        loadCardTypeSetting()
        displayEstimationType()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func estimationTypeSegementValueChanged(_ sender: UISegmentedControl) {
        displayEstimationType()
        saveCardTypeSetting()
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        selectedCard = sender
        performSegue(withIdentifier: "goToSelectedCardScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSelectedCardScreen" {
            let desViewController = segue.destination as! SelectedCardViewController
            desViewController.textPassedOver = selectedCard.titleLabel!.text
        }
    }
    
    func displayEstimationType() {
        if estimationTupeSegmentControl.selectedSegmentIndex == 0 {
            showPoker(isVisible: true)
        } else {
            showPoker(isVisible: false)
        }
    }
    
    func showPoker(isVisible: Bool) {
        pokerView.isHidden = !isVisible
        tshirtView.isHidden = isVisible
    }
    
    /*
    // MARK: - Core Data Management
    */
    func loadCardTypeSetting() {
        if let cardTypeSetting = getCardTypeSetting() {
            estimationTupeSegmentControl.selectedSegmentIndex = cardTypeSetting.value(forKey: "selectedindex") as! Int
        }
    }
    

    func getCardTypeSetting() -> NSManagedObject? {
        let cardTypeSettingList = dataCoreManager.fetchRows()
        if (cardTypeSettingList.count > 0 ) {
            return cardTypeSettingList.first
        }
        return nil
    }
    
    func saveCardTypeSetting() {
        if let cardTypeSetting = getCardTypeSetting() {
            cardTypeSetting.setValue(estimationTupeSegmentControl.selectedSegmentIndex, forKey: "selectedindex")
        } else {
            let rowEntity = dataCoreManager.newRowToEntity()
            rowEntity.setValue(estimationTupeSegmentControl.selectedSegmentIndex, forKey: "selectedindex")
            
        }
    }
    
}

