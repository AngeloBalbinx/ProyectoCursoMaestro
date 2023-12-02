//
//  BuscarCursoViewController.swift
//  ProjectCursoMaestro
//
//  Created by DAMII on 7/10/23.
//

import UIKit


class BuscarCursoViewController: UIViewController,UITableViewDataSource {

    
    @IBOutlet weak var cursosTableView: UITableView!
    var cursosList : [Course] = []
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cursosTableView.dataSource = self
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
        cursosList.append(Course(imagen: "https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png", titulo: "Java", categoria: "Tecnologia"))
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
