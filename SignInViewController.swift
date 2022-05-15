

import UIKit
import CoreData

class SignInViewController: UIViewController {
    var n : Int = 0
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var userArray = [UserDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let request : NSFetchRequest<UserDetails> = UserDetails.fetchRequest()
        do {
            userArray = try context.fetch(request)
           // print(userArray[0].username)
        } catch {
            print("Error fetching data from context\(error)")
        }
        do{
        let newUserDetails = try UserDetails(context: context)
            n = userArray.count
            for i in 0...n-1{
            if ((txtUsername.text == userArray[i].username) && (txtPassword.text == userArray[i].password)){
                performSegue(withIdentifier: "home", sender: .none)
            }
                }
            } catch {
            print("test")
                
            }
    }
    
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        performSegue(withIdentifier: "signup", sender: .none)
        
    }
    
}
