//
//  MainViewController.swift
//  ProjectCursoMaestro
//
//  Created by Genaro Martinez on 1/12/23.
//

import UIKit

struct Lesson: Codable {
    let id, name: String
    let hour, capacity, minCapacity: Int
    let createdAt, updatedAt: String
    let deleted: Bool
    let level, modality, status: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, hour, capacity
        case minCapacity = "min_capacity"
        case createdAt, updatedAt, deleted, level, modality, status
        case v = "__v"
    }
}

class MainViewController: UIViewController, UITableViewDataSource {
    
    // components
    @IBOutlet weak var mainTable: UITableView!
    
    // variables
    var lessons: [Lesson] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        mainTable.dataSource = self
        
        fetchLessons()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as!  MainTableViewCell
        
        let lesson = lessons[indexPath.row]
        
        cell.nameLabel.text = lesson.name
        cell.modalityLabel.text = lesson.modality
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let lesson = lessons[indexPath.row]
        
        print("lesson")
        print(lesson)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainDetailViewController") as! MainDetailViewController
        
        viewController.idLabel.text = lesson.id
        viewController.nameLabel.text = lesson.name
        viewController.levelLabel.text = lesson.level
        viewController.modalityLabel.text = lesson.modality
        viewController.durationLabel.text = "\(lesson.hour) horas"
        viewController.capacityLabel.text = "\(lesson.capacity) (minima: \(lesson.minCapacity)"
                
        self.present(viewController, animated: true, completion: nil)
    }
    
    func fetchLessons() {
        let apiURL = "/api/lesson"

        ApiManager.get(
            endpoint: apiURL
        ) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode([Lesson].self, from: data)
                    
                    self.lessons = response
                    
                    DispatchQueue.main.async {
                        self.mainTable.reloadData()
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
