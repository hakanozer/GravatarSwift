//
//  ViewController.swift
//  GravatarSwift
//
//  Created by Hakan on 1/12/17.
//  Copyright © 2017 Hakan. All rights reserved.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBAction func btnLogin(_ sender: UIButton) {
        let mail = email.text
        if isValidEmail(mailData: mail!) {
            // send mailData
            self.performSegue(withIdentifier: "Profile", sender: mail)
        }else {
            SCLAlertView().showWarning("Error", subTitle: "Please enter your email address")
            self.email.becomeFirstResponder()
        }
    }
    
    func isValidEmail(mailData:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let trimmedString = mailData.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: trimmedString)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Profile" {
            let vc = segue.destination as! Profile
            vc.imageUrl = sender as! String
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.email.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

