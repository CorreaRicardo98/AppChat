//
//  EditarPerfilViewController.swift
//  Login
//
//  Created by marco rodriguez on 31/05/21.
//

import UIKit
import Firebase



class EditarPerfilViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var nombreEditarTF: UITextField!
    @IBOutlet weak var imagenPerfil: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestura = UITapGestureRecognizer(target: self, action: #selector(clickImage))
        gestura.numberOfTapsRequired = 1
        gestura.numberOfTouchesRequired = 1
        
        imagenPerfil.addGestureRecognizer(gestura)
        imagenPerfil.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    @objc func clickImage(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func tomarFotoButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func GuardarPerfilButton(_ sender: UIButton) {
        guard let image = imagenPerfil.image, let datosImage = image.jpegData(compressionQuality: 1.0) else {return}
        
        let imageNombre = UUID().uuidString
        
        
        
        
        navigationController?.popViewController(animated: true)
        print("Perfil Actualizado!")
    }
    
}
