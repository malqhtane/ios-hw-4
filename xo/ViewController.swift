//
//  ViewController.swift
//  X-O
//
//  Created by shaikha alqhtane on 6/30/20.
//  Copyright © 2020 shaikha. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var TurnLabel: UILabel!
    @IBOutlet weak var xCounterLabel: UILabel!
    @IBOutlet weak var oCounterLabel: UILabel!
    @IBOutlet weak var imageView: UILabel!
    var bombSoundEffect : AVAudioPlayer?
    var audioPloayer = AVAudioPlayer()
   // x % 2 == 0 -> زوجي
   // x % 2 == 1 -> فردي
    var buttons: [UIButton] = [ ]
    //var colors: [Color] = [ .blue ,]
    var counter = 0
    var xWins = 0
    var oWins = 0
    var xCounter = 0
    var oCounter = 0
    var turnCount = 0
    var round = 0
    var nextRound = false
    
    
    
   // override func viewDidLoad() {
    //    buttons = [b1, b2, b3, b4, b5, b6 ,b7 ,b8 ,b9]
    //}
    @IBAction func resetTapped() {
        self.restarGame()
    }
    @IBAction func sound(_sender: Any){
        let path=Bundle.main.path(forResource:"chicken.mp3" , ofType:nil)!
                 let ur1 = URL(fileURLWithPath: path)
                 do {
                     bombSoundEffect = try
                         AVAudioPlayer(contentsOf: ur1)
                     bombSoundEffect?.play()
                 } catch {
                 }
    }
   
    
    @IBAction func mute(_sender:Any){
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
      
        let path=Bundle.main.path(forResource:"chicken.mp3" , ofType:nil)!
                 let ur1 = URL(fileURLWithPath: path)
                 do {
                     bombSoundEffect = try
                         AVAudioPlayer(contentsOf: ur1)
                     bombSoundEffect?.play()
                 } catch {
                 }
    }
    
    @IBAction func press(_ sender: UIButton) {
        //xCounterLabel.text = String(xCounter)
        //oCounterLabel.text = String(oCounter)
       print("تم الضغط عليي!")
    print(counter)
        if counter % 2 == 0{
            let path=Bundle.main.path(forResource:"chicken.mp3" , ofType:nil)!
            let ur1 = URL(fileURLWithPath: path)
            do {
                bombSoundEffect = try
                    AVAudioPlayer(contentsOf: ur1)
                bombSoundEffect?.play()
            } catch {
            }
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            TurnLabel.text = "O Turn"
        }
        else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            TurnLabel.text = "X Turn"
            let path=Bundle.main.path(forResource:"pika.mp3" , ofType:nil)!
            let ur1 = URL(fileURLWithPath: path)
            do {
                bombSoundEffect = try
                    AVAudioPlayer(contentsOf: ur1)
                bombSoundEffect?.play()
            } catch {
            }
        }
        counter += 1
        sender.isEnabled = false
        
        
        Winning(winner: "X")
        Winning(winner: "O")
        
    
    
    }
        
   
    
       
       // func cheeckWinner(p: String)-> Bool{
          // let   f1 = b1.titleLabel?.text
          // let   f2 = b2.titleLabel?.text
          // let   f3 = b3.titleLabel?.text
          // let   f4 = b4.titleLabel?.text
          // let   f5 = b5.titleLabel?.text
          // let   f6 = b6.titleLabel?.text
          // let   f7 = b7.titleLabel?.text
          // let   f8 = b8.titleLabel?.text
          // let   f9 = b9.titleLabel?.text
          //
          // let r1 = (f1,f2,f3) == (p , p,p)
          // let r2 = (f4,f5,f6) == (p , p,p)
          // let r3 = (f7,f8,f9) == (p , p,p)
          // let c1 = (f1,f4,f7) == (p , p,p)
          // let c2 = (f2,f5,f8) == (p , p,p)
          // let c3 = (f4,f6,f9) == (p , p,p)
          // let d1 = (f1,f5,f9) == (p , p,p)
          // let d2 = (f3,f5,f7) == (p , p,p)
          // if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
             //   print("👏🏻 \(p) bravoo wins ")
              //  return true
           // }
 //      @IBAction func button1press(_ sender: UIButton) {
 //  if let button = sender as? UIButton {
 //          if button.backgroundColor == UIColor.green {
 //              button.backgroundColor = UIColor.red
 //          }
 //          else if button.backgroundColor == UIColor.red {
 //              button.backgroundColor = UIColor.green
 //          }
 //      }
 //  }
 //
    
  //  func winning(winner: String)
  //     {
  //
  //     if  (b1.titleLabel?.text == winner && b2.titleLabel?.text ==  winner && b3.titleLabel?.text == winner) || (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) || (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) || (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) || (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) || (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) || (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) || (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
  //            {
  //                print("\(winner)الفائز")
  //            }
  //     let alertController = UIAlertController(title: "\(winner)O فاز", message: "قم بالضغط على الزر التالي كي يتم اعادة اللعب", preferredStyle: .alert)
  //      let restartAction = UIAlertAction(title: "اعادة اللعب", style: .cancel, handler: nil)
  //     alertController.addAction(restartAction)
  //     present(alertController, animated: true, completion: nil)
  // //}
  //
         func Winning(winner: String)
           {
          if  (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text ==  winner) || (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) || (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) || (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) || (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) || (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) || (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) || (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {
            print("\(winner) الفاز")
            let alertController = UIAlertController(title: "\(winner) فاز", message: "قم بالضغط على الزر التالي كي يتم اعادة اللعب", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "اعادة اللعب", style: .cancel) { alert in
                // restart game
                self.restarGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    func restarGame(){
        for b in buttons{
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }
        
        counter = 0
        TurnLabel.text = "X Turn"
    }
}

