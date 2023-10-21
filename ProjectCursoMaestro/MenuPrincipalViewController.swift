//
//  MenuPrincipalViewController.swift
//  ProjectCursoMaestro
//
//  Created by DAMII on 7/10/23.
//

import UIKit

struct Curso{
    var imagen: String
    var titulo: String
    var categoria: String
}

class MenuPrincipalViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var cursosTableView: UITableView!
    var cursosList : [Curso] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cursosTableView.dataSource = self
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
