//
//  RegisterViewController.swift
//  ProjectCursoMaestro
//
//  Created by Genaro Martinez on 29/11/23.
//

import UIKit

class RegisterViewController: UIViewController {
    

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var lastnameInput: UITextField!
    @IBOutlet weak var dniInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func handleRegisterSubmit(_ sender: Any) {
        let nameHasText = nameInput.hasText
        let lastnameHasText = lastnameInput.hasText
        let emailHasText = emailInput.hasText
        let passwordHasText = passwordInput.hasText
        let dniHasText = dniInput.hasText
        
        let missingData = !nameHasText
            || !lastnameHasText
            || !emailHasText
            || !passwordHasText
            || !dniHasText
        
        if(missingData) {
            self.showErrorAlert(
                title: "ERROR",
                message: "Ingrese todos los campos"
            )
            return
        }
        
        let name = nameInput.text
        let lastname = lastnameInput.text
        let email = emailInput.text
        let password = passwordInput.text
        let dni = dniInput.text
        
        let apiURL = "/api/auth/register"
        let parameters = [
            "name": name,
            "lastname": lastname,
            "dni": dni,
            "role": "645fca864d5277666f4cb5f0",
            "email": email,
            "password": password,
        ]
        
        ApiManager.post(
            endpoint: apiURL,
            params: parameters as [String : Any]
        ) { result in
            switch result {
            case .success(_):
                // Handle successful response
                DispatchQueue.main.async {
                    let storyBoard = UIStoryboard(
                        name: "Main",
                        bundle: nil
                    )
                    
                    let viewController = storyBoard.instantiateViewController(
                        withIdentifier: "LoginViewController"
                    )
                    
                    viewController.modalPresentationStyle = .fullScreen
                    
                    self.present(viewController, animated: true, completion: nil)
                }
            case .failure(let error):
                // Handle error
                self.showErrorAlert(
                    title: "ERROR",
                    message: "Inténtelo de nuevo"
                )
                
                print("Error: \(error)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
