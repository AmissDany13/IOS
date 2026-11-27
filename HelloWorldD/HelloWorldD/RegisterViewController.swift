
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
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
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

            // Mostrar borde rojo cuando la contraseña no es válida
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 1.0

            // Mostrar el mensaje de error debajo del campo
            passwordErrorLabel.text = error
            passwordErrorLabel.isHidden = false

            print("Error en Contraseña: \(error)")

        } else {

            // Quitar el borde rojo
            passwordTextField.layer.borderWidth = 0.0

            // Ocultar el mensaje de error
            passwordErrorLabel.text = ""
            passwordErrorLabel.isHidden = true

            print("Contraseña válida")
        }


       
        // VALIDACIÓN DE CONFIRMAR CONTRASEÑA

        let confirmPassword = confirmPasswordTextField.text ?? ""

        if let error = viewModel.validateConfirmPassword(
            confirmPassword,
            password: password
        ) {

            // Mostrar borde rojo cuando las contraseñas no coinciden
            confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
            confirmPasswordTextField.layer.borderWidth = 1.0

            // Mostrar el mensaje de error debajo del campo
            confirmPasswordErrorLabel.text = error
            confirmPasswordErrorLabel.isHidden = false

            print("Error en Confirmar contraseña: \(error)")
        } else {

            // Quitar el borde rojo
            confirmPasswordTextField.layer.borderWidth = 0.0

            // Ocultar el mensaje cuando ambas contraseñas coinciden
            confirmPasswordErrorLabel.text = ""
            confirmPasswordErrorLabel.isHidden = true

            print("Confirmación de contraseña válida")
        }
        
        // VALIDACIÓN GENERAL DEL FORMULARIO

        // Comprobamos si alguno de los cinco campos tiene errores
        let hayErrores =
            viewModel.validateUsername(username) != nil ||
            viewModel.validateName(name) != nil ||
            viewModel.validateLastName(lastName) != nil ||
            viewModel.validatePassword(password) != nil ||
            viewModel.validateConfirmPassword(
                confirmPassword,
                password: password
            ) != nil

        if hayErrores {

            // Detener el registro si encontramos algún error
            print("Registro detenido: hay campos incorrectos")
            return
        }

        // Todos los campos cumplen las validaciones
        print("Formulario válido: listo para registrar")
        
        // MARK: - Guardar datos con UserDefaults

        // Guardar los datos únicamente cuando el formulario es válido
        UserDefaults.standard.set(name, forKey: "registeredName")
        UserDefaults.standard.set(username, forKey: "registeredUsername")
        UserDefaults.standard.set(password, forKey: "registeredPassword")

        // Confirmar en consola que se ejecutó el guardado
        print("Datos del registro guardados correctamente")

        
        // PROCESAMIENTO DEL REGISTRO

        // Deshabilitar el botón para evitar varios registros
        sender.isEnabled = false

        // Cambiar el texto mientras se procesa
        sender.setTitle("Procesando...", for: .disabled)

        print("Procesando registro...")

        
        // Simular el procesamiento del registro durante 2 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {

            // Volver a habilitar el botón Registrarme
            sender.isEnabled = true

            print("Procesamiento finalizado")

            // Crear una ventana con el resultado
            let alert = UIAlertController(
                title: "Formulario válido",
                message: "Tus datos fueron validados correctamente.",
                preferredStyle: .alert
            )

            
            // Crear el botón Aceptar
            let aceptar = UIAlertAction(
                title: "Aceptar",
                style: .default
            ) { _ in

                // Regresar a la pantalla anterior (Login)
                self.navigationController?.popViewController(
                    animated: true
                )
            }


            alert.addAction(aceptar)

            // Mostrar el mensaje en pantalla
            self.present(alert, animated: true)
        }



    }
    // MARK: - Ciclo de vida

    override func viewDidLoad() {
        super.viewDidLoad()

        // Los cinco mensajes de error comienzan ocultos
        usernameErrorLabel.isHidden = true
        nameErrorLabel.isHidden = true
        lastNameErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        confirmPasswordErrorLabel.isHidden = true

        print("Pantalla de registro iniciada")
    }
}
