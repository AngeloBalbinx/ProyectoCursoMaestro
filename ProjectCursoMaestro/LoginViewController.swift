//
//  LoginViewController.swift
//  ProjectCursoMaestro
//
//  Created by DAMII on 7/10/23.
//

import UIKit

struct SLoginResponse: Decodable {
    let token: String
}

class LoginViewController: UIViewController {
    
    // Inputs
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleLoginSubmit(_ sender: Any) {
        let userHasText = userInput.hasText
        let passwordHasText = passwordInput.hasText
        
        if(!userHasText || !passwordHasText) {
            return
        }
        
        let user = userInput.text
        let password = passwordInput.text
        
        
        
        let apiURL = "/api/auth/login"
        let parameters = [
            "email": user,
            "password": password,
        ]

        ApiManager.post(
            endpoint: apiURL,
            params: parameters as [String : Any]
        ) { result in
            switch result {
            case .success(let data):
                // Handle successful response
                
                do {
                    let response = try JSONDecoder().decode(SLoginResponse.self, from: data)
                    
                    print("token: \(response.token)")
                    
                    GlobalManager.setJWTToken(response.token)
                    
                    print("Response: \(String(data: data, encoding: .utf8) ?? "")")
                    
                    DispatchQueue.main.async {
                        let storyBoard = UIStoryboard(
                            name: "Main",
                            bundle: nil
                        )
                        
                        let viewController = storyBoard.instantiateViewController(
                            withIdentifier: "TabBarController"
                        )
                        
                        viewController.modalPresentationStyle = .fullScreen
                        
                        self.present(viewController, animated: true, completion: nil)
                    }

                }
                catch {
                    print("Error: \(error)")
                }

            case .failure(let error):
                // Handle error
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
