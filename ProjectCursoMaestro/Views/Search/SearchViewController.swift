//
//  SearchViewController.swift
//  ProjectCursoMaestro
//
//  Created by Genaro Martinez on 1/12/23.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    // components
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchTableViewCell", for: indexPath) as!  SearchTableViewCell
        
        let lesson = lessons[indexPath.row]
      
        cell.nameLabel.text = lesson.name
        cell.levelLabel.text = lesson.level
        cell.modalityLabel.text = lesson.modality
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
        
        guard let searchInput = searchBar.text else {return}
        
        fetchLessonsByName(name: searchInput)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
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

    func fetchLessonsByName(name: String) {
        let apiURL = "/api/lesson/search?name=\(name)"

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
