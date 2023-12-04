//
//  AccountViewController.swift
//  ProjectCursoMaestro
//
//  Created by Genaro Martinez on 2/12/23.
//

import UIKit

struct User: Codable {
    let id, name, lastname, dni: String
    let role: String
    let deleted: Bool
    let createdAt, updatedAt, email, password: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, lastname, dni, role, deleted, createdAt, updatedAt, email, password
        case v = "__v"
    }
}


class AccountViewController: UIViewController {

    // components
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var alreadyInit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(alreadyInit) {
            return
        }
        
        fetchUser()
        // Do any additional setup after loading the view.
    }
    
    func fetchUser() {
        alreadyInit = true
        
        let apiURL = "/api/admin/me"

        ApiManager.get(
            endpoint: apiURL
        ) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(User.self, from: data)
                                  
                    let name = response.name
                    let lastname = response.lastname
                    let email = response.email
                    
                    DispatchQueue.main.async {
                        self.fullnameLabel.text = "\(name) \(lastname)"
                        self.emailLabel.text = email
                        //self.imageView. = ""
                    }
                    
                }
                catch {
                    self.showErrorAlert(
                        title: "ERROR",
                        message: "Inténtelo de nuevo"
                    )
                    
                    print("Error: \(error)")
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
