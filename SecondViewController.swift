//
//  SecondViewController.swift
//  User_Login
//
//  Created by TRAINING 6 on 15/05/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var loginData = [Login_Data]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var txtUsrR: UITextField!
    
    @IBOutlet weak var txtPasR: UITextField!
    
    @IBOutlet weak var txtCPR: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    @IBAction func btnClear(_ sender: Any) {
        txtUsrR.text = ""
        txtPasR.text = ""
        txtCPR.text = ""
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        let newLoginData = Login_Data(context: self.context)
        newLoginData.userName = txtUsrR.text!
        let alert = UIAlertController(title: "Password mismatch", message: "type same password", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: .default)
        if txtPasR.text == txtCPR.text{
            newLoginData.password = txtPasR.text!
            saveItem()
        }
        else{
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        performSegue(withIdentifier: "register", sender: .none)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "register"{
//            let obj = segue.destination as! ViewController
//            obj.userRegister = txtUsrR.text!
//        }
//    }
    func saveItem(){
        do{
            try context.save()
        }catch{
            print("Error saving context\(error)")
        }
    }
}
