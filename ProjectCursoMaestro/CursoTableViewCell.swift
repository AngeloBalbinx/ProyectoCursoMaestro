//
//  CursoTableViewCell.swift
//  ProjectCursoMaestro
//
//  Created by DAMII on 21/10/23.
//

import UIKit

class CursoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cursoImageView: UIImageView!
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var categoriaLabel: UILabel!
    
    
    @IBOutlet weak var cursoImageView2: UIImageView!
    
    @IBOutlet weak var tituloLabel2: UILabel!
    
    @IBOutlet weak var categoriaLabel2: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
