//
//  MainDetailViewController.swift
//  ProjectCursoMaestro
//
//  Created by Genaro Martinez on 2/12/23.
//

import UIKit

class MainDetailViewController: UIViewController {

    // label
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var modalityLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    
    var id: String = ""
    var name: String = ""
    var level: String = ""
    var modality: String = ""
    var duration: String = ""
    var capacity: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idLabel.text = id
        nameLabel.text = name
        levelLabel.text = level
        modalityLabel.text = modality
        durationLabel.text = duration
        capacityLabel.text = capacity
        
        // Do any additional setup after loading the view.
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
