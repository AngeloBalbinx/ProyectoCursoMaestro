//
//  MainTableViewCell.swift
//  ProjectCursoMaestro
//
//  Created by Genaro Martinez on 1/12/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    // Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modalityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}