
import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

  //Errores
    @IBOutlet weak var usernameErrorLabel: UILabel!

    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var lastNameErrorLabel: UILabel!
  
    
    // MARK: - ViewModel

    private let viewModel = RegisterViewModel()

    // MARK: - Botón Registrarme

    @IBAction func registerButtonTapped(_ sender: UIButton) {

        print("Botón Registrarme presionado")

        // VALIDACIÓN DE USUARIO

        let username = usernameTextField.text ?? ""

        if let error = viewModel.validateUsername(username) {

            usernameTextField.layer.borderColor = UIColor.red.cgColor
            usernameTextField.layer.borderWidth = 1.0

            usernameErrorLabel.text = error
            usernameErrorLabel.isHidden = false

            print("Error en Usuario: \(error)")

        } else {

            usernameTextField.layer.borderWidth = 0.0

            usernameErrorLabel.text = ""
            usernameErrorLabel.isHidden = true

            print("Usuario válido")
        }

        
        // VALIDACIÓN DE NOMBRE

        let name = nameTextField.text ?? ""

        if let error = viewModel.validateName(name) {

            // Mostrar borde rojo cuando el nombre no es válido
            nameTextField.layer.borderColor = UIColor.red.cgColor
            nameTextField.layer.borderWidth = 1.0

            // Mostrar el mensaje de error debajo del campo
            nameErrorLabel.text = error
            nameErrorLabel.isHidden = false

            print("Error en Nombre: \(error)")

        } else {

            // Quitar el borde rojo cuando el nombre es válido
            nameTextField.layer.borderWidth = 0.0

            // Ocultar el mensaje de error
            nameErrorLabel.text = ""
            nameErrorLabel.isHidden = true

            print("Nombre válido")
        }


        // VALIDACIÓN DE APELLIDO
        let lastName = lastNameTextField.text ?? ""

        if let error = viewModel.validateLastName(lastName) {

            // Mostrar borde rojo cuando el apellido no es válido
            lastNameTextField.layer.borderColor = UIColor.red.cgColor
            lastNameTextField.layer.borderWidth = 1.0

            // Mostrar el mensaje de error debajo del campo
            lastNameErrorLabel.text = error
            lastNameErrorLabel.isHidden = false

            print("Error en Apellido: \(error)")

        } else {

            // Quitar el borde rojo cuando el apellido es válido
            lastNameTextField.layer.borderWidth = 0.0

            // Ocultar el mensaje de error
            lastNameErrorLabel.text = ""
            lastNameErrorLabel.isHidden = true

            print("Apellido válido")
        }

        if let error = viewModel.validateLastName(lastName) {

            lastNameTextField.layer.borderColor = UIColor.red.cgColor
            lastNameTextField.layer.borderWidth = 1.0

            print("Error en Apellido: \(error)")

        } else {

            lastNameTextField.layer.borderWidth = 0.0

            print("Apellido válido")
        }

        // VALIDACIÓN DE CONTRASEÑA

        let password = passwordTextField.text ?? ""

        if let error = viewModel.validatePassword(password) {

            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 1.0

            print("Error en Contraseña: \(error)")

        } else {

            passwordTextField.layer.borderWidth = 0.0

            print("Contraseña válida")
        }

        // VALIDACIÓN DE CONFIRMAR CONTRASEÑA

        let confirmPassword = confirmPasswordTextField.text ?? ""

        if let error = viewModel.validateConfirmPassword(
            confirmPassword,
            password: password
        ) {

            confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
            confirmPasswordTextField.layer.borderWidth = 1.0

            print("Error en Confirmar contraseña: \(error)")

        } else {

            confirmPasswordTextField.layer.borderWidth = 0.0

            print("Confirmación de contraseña válida")
        }
    }

    // MARK: - Ciclo de vida

    override func viewDidLoad() {
        super.viewDidLoad()

        // Los mensajes de error comienzan ocultos
        usernameErrorLabel.isHidden = true
        nameErrorLabel.isHidden = true
        lastNameErrorLabel.isHidden = true

        print("Pantalla de registro iniciada")
    }
}
