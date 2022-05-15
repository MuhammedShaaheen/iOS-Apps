//
//  ViewController.swift
//  User_Login
//
//  Created by TRAINING 6 on 15/05/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var userRegister = [Login_Data]()
    
    var k : Int = 0
    var x : Int = 0
    
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var txtUser: UITextField!
    
    @IBOutlet weak var txtPas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        txtUser.text = userRegister
    }

    @IBAction func btnSignin(_ sender: Any) {
        let request : NSFetchRequest<Login_Data> = Login_Data.fetchRequest()
        do{
            userRegister = try context.fetch(request)
            x = userRegister.count
        } catch{
            print("Error Fetching data from context\(error)")
        }
        if txtUser.text == userRegister[x].userName && txtPas.text == userRegister[x].password{
            for x in 0...(x-1){
                    k = x
                    print("1:\(k)")
                    performSegue(withIdentifier: "signin", sender: .none)
                }
            }
        else {
        let alert = UIAlertController(title: "Username or Password is wrong", message: "Use Registered Credential", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
            }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signin"{
            let obj = segue.destination as! HomeViewController
            let request : NSFetchRequest<Login_Data> = Login_Data.fetchRequest()
            do{
                userRegister = try context.fetch(request)
                print("2:\(k)")
                obj.displayData = userRegister[k].userName!

            } catch {
                print("Error Fetching data from context\(error)")
            }
        }
    }
    @IBAction func btnSignup(_ sender: Any) {
        performSegue(withIdentifier: "signup", sender: .none)
    }
//    func loadItem(){
//        let request : NSFetchRequest<Login_Data> = Login_Data.fetchRequest()
//        do{
//            userRegister = try context.fetch(request)
//           let i = userRegister.count
//            txtUser.text = userRegister[i-1].userName
//        } catch {
//            print("Error Fetching data from context\(error)")
//        }
//    }
}

