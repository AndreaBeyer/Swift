//
//  ViewController.swift
//  PlusOuMoinsIOS
//
//  Created by Andréa on 06/09/2020.
//  Copyright © 2020 Andréa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myBtn : UIButton!
    @IBOutlet var newGameBTN : UIButton!
    @IBOutlet var myField : UITextField!
    @IBOutlet var answ : UITextField!
    @IBOutlet var tryF : UITextField!
    @IBOutlet var index : UISegmentedControl!
    
    var difficulty = 0
    var nbTry = 0
    var rand: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRandom()
        resetUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clicAnsw(sender : UIButton){
        
        nbTry++
        
        if(Int(answ.text!) == nil){
            myField.text = "Veuillez entrer un nombre"
        }
        else if(Int(answ.text!) > rand){
            myField.text = "C'est moins"
        }
        else if(Int(answ.text!) < rand){
            myField.text = "C'est Plus"
        }
        else{
            myField.text = "Gagné en " + nbTry.description + " coups"
            myBtn.enabled = false
            answ.enabled = false
        }
        
        answ.text = nil
        tryF.text = nbTry.description
    }
    
    @IBAction func clicNG(sender : UIButton){
        newRandom()
        resetUI()
    }
    
    func resetUI(){
        myBtn.enabled = true
        answ.enabled = true
        tryF.text = nbTry.description
        
        answ.text = nil
    }
    
    func newRandom(){
        switch difficulty{
        case 0:
            rand = createIntRandom(1, max: 10)
            myField.text = "Entrez un nombre entre 1 et 10"
            break
        case 1:
            rand = createIntRandom(1, max: 100)
            myField.text = "Entrez un nombre entre 1 et 100"
            break
        case 2:
            rand = createIntRandom(1, max: 1000)
            myField.text = "Entrez un nombre entre 1 et 1000"
            break
        default:
            break
        }

        nbTry = 0
        print(rand.description)
    }
    
    func createIntRandom(min: Int, max: Int) -> Int{
        
        return Int(arc4random_uniform(UInt32(max-min+1)) + UInt32(min))
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        difficulty = sender.selectedSegmentIndex
        newRandom()
        resetUI()
        print(difficulty)
    }



}

