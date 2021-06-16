//
//  ViewController.swift
//  Login
//
//  Created by marco rodriguez on 19/05/21.
//

import UIKit
import CLTypingLabel
import Firebase
import GoogleSignIn




class ViewController: UIViewController,GIDSignInDelegate {

    

    @IBOutlet weak var btnIS: UIButton!
    @IBOutlet weak var btnR: UIButton!
    @IBOutlet weak var mensajeBienvendiaLebel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String{
            performSegue(withIdentifier: "logeado", sender: self)
        }
        
        mensajeBienvendiaLebel.charInterval = 0.05
        
        btnR.layer.cornerRadius = 10
        btnR.clipsToBounds = true
        
        btnIS.layer.cornerRadius = 10
        btnIS.clipsToBounds = true
        
        mensajeBienvendiaLebel.textColor = .white
        
        mensajeBienvendiaLebel.text = "Hola bienvenidos a la app oficial del Intituto Tecnologico de Morelia, hecha con mucho cariño para ti......"
    
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil && user.authentication != nil{
            let credencial = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
            
            Auth.auth().signIn(with: credencial) { (resultado, error) in
                if let resultado = resultado, error == nil{
                    self.useSegue()
                }else{
                    print("Error")
                }
            }
        }
    }
    
    func useSegue(){
        performSegue(withIdentifier: "logeado", sender: self)
        
    }
    
    @IBAction func inicioGoogle(_ sender: Any) {
        
        GIDSignIn.sharedInstance()?.signIn()
    }
    

}

