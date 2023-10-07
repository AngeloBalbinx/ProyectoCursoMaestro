//
//  PerfilViewController.swift
//  ProjectCursoMaestro
//
//  Created by DAMII on 7/10/23.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var Avatar: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Avatar.layer.cornerRadius = Avatar.bounds.size.width / 2.0        // Do any additional setup after loading the view.
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
