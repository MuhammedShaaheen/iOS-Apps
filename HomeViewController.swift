//
//  HomeViewController.swift
//  User_Login
//
//  Created by TRAINING 6 on 15/05/22.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    var displayData : String = ""
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    @IBOutlet weak var txtDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtDisplay.text = displayData
    }
    
    @IBAction func btnBack(_ sender: Any) {
        performSegue(withIdentifier: "back", sender: .none)
    }
//    func loadItem(){
//        let request : NSFetchRequest<Login_Data> = Login_Data.fetchRequest()
//        do{
//            userRegister = try context.fetch(request)
//            var i = userRegister.count
//            print(i)
//            txtDisplay.text = userRegister[i-1].userName
//        }catch {
//            print("Error Fetching data from context\(error)")
//        }
//    }
}
