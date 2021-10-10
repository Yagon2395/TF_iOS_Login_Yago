//
//  ViewController.swift
//  TF_iOS_Login_Yago
//
//  Created by Desenvolvimento on 10/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var userNameTextField: UITextField!{
        didSet {
            userNameTextField.tintColor = UIColor.lightGray
            let imageName = "user-icon"
            let image = UIImage(named: imageName)!
            userNameTextField.setIcon(image)
        }
     }
    
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            let imageName = "password-icon"
            let image = UIImage(named: imageName)!
            passwordTextField.setIcon(image)
        }
     }
    
    @IBAction func performLogin(_ sender: UIButton) {
        let validationResult = validate()
        if(validationResult.0){
            let defaults = UserDefaults.standard
            defaults.set(true, forKey: "isAuthenticated")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
            UIApplication.shared.keyWindow?.rootViewController = vc
            //performSegue(withIdentifier: "mainUse", sender: nil)
        }else{
            let alert = UIAlertController(title: "Atenção", message: validationResult.1, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validate() -> (Bool,String){
        let email = userNameTextField.text
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if(!emailPred.evaluate(with: email)){
            return (false, "Digite um e-mail válido.")
        }
        
        let password = passwordTextField.text
        
        if((password ?? "").isEmpty){
            return (false, "Digite uma senha.")
        }
        
        return (true, "")
    }
    
}

// coloca icone de imagem a esquerda do texto dentro do editor
extension UITextField {
func setIcon(_ image: UIImage) {
   let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 5, width: 20, height: 20))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 30, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}

