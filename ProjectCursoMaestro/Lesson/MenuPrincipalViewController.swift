//
//  MenuPrincipalViewController.swift
//  ProjectCursoMaestro
//
//  Created by DAMII on 7/10/23.
//

import UIKit

struct Course{
    var imagen: String
    var titulo: String
    var categoria: String
}

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


class MenuPrincipalViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var cursosTableView: UITableView!
    var cursosList : [Course] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cursosTableView.dataSource = self
        
        fetchLessons()
        
        /*
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Curso(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        */
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cursoCell", for: indexPath) as! CursoTableViewCell
        
        let curso = cursosList[indexPath.row]
        
        
      
        cell.tituloLabel.text = curso.titulo
        cell.categoriaLabel.text = curso.categoria
        
        
        return cell
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
                    
                    
                    
                    /*
                    DispatchQueue.main.async {
                        for course in response {
                            let courseAux = Course(imagen: "", titulo: couse.name, categoria: course.name)
                            
                            
                        }
                        
                        self.cursosTableView.reloadData()
                    }
                    */

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
