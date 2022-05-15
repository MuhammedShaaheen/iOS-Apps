

import UIKit
import CoreData

class SignUpViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var userArray = [UserDetails]()
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCnfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
       
        txtUsername.text = ""
        txtPassword.text = ""
        txtCnfPassword.text = ""
        
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        if txtPassword.text == txtCnfPassword.text {

            let newUserDetails = UserDetails(context: self.context)
            newUserDetails.username = txtUsername.text!
            newUserDetails.password = txtPassword.text!
            //userArray.append(newUserDetails)
            //print("User details Saved Successfully")
            saveData()
            self.dismiss(animated: true, completion: nil)
            txtUsername.text = ""
            txtPassword.text = ""
            txtCnfPassword.text = ""
        } else {
            print("*****")
            print(txtPassword.text!)
            print(txtCnfPassword.text!)
            let alert = UIAlertController(title: "Wrong", message: "Entered password incorrect, Please recheck", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                print("Wrong")
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    

    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error saving context\(error)")
        }
    
    }

}
}
