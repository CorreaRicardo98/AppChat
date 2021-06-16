//
//  TableViewCell.swift
//  Login
//
//  Created by Mac17 on 10/06/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var textoMensaje: UILabel!
    @IBOutlet weak var nombrePersona: UILabel!
    @IBOutlet weak var imagePerson: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
