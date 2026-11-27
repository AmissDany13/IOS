import UIKit
import LocalAuthentication

class MainViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    private let viewModel = UserViewModel()
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {

        print("BOTÓN PRESIONADO")

        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let usuarioVacio = username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let contrasenaVacia = password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty

        setErrorBorder(for: usernameTextField, show: usuarioVacio)
        setErrorBorder(for: passwordTextField, show: contrasenaVacia)

        if usuarioVacio || contrasenaVacia {

            if usuarioVacio {
                print("El campo Usuario está vacío")
            }

            if contrasenaVacia {
                print("El campo Contraseña está vacío")
            }

            return
        }



        let user = User(
            name: "",
            userName: username,
            password: password
        )

        if viewModel.validateUser(user: user) {
            
            // MARK: - Validar usuario registrado

            // Recuperar las credenciales guardadas
            let registeredUsername = UserDefaults.standard.string(
                forKey: "registeredUsername"
            )

            let registeredPassword = UserDefaults.standard.string(
                forKey: "registeredPassword"
            )

            // Comprobar que coincidan con los datos del Login
            guard username == registeredUsername &&
                  password == registeredPassword else {

                print("Usuario o contraseña incorrectos")
                return
            }

            print("Login válido")
            UserDefaults.standard.set(username, forKey: "username")
            performSegue(withIdentifier: "showHome", sender: self)
        } else {
            print("Completa todos los campos")
        }
    }
    
    @IBAction func faceIDTapped(_ sender: UIButton) {
        
        // MARK: - Verificar usuario antes de usar Face ID

        // Recuperar el usuario guardado durante el registro
        let registeredUsername = UserDefaults.standard.string(
            forKey: "registeredUsername"
        )

        // No permitir Face ID si todavía no existe una cuenta
        guard let registeredUsername = registeredUsername,
              !registeredUsername.isEmpty else {

            print("No existe un usuario registrado")
            return
        }

        print("Usuario registrado encontrado: \(registeredUsername)")

        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            error: &error
        ) {

            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Confirma tu identidad para iniciar sesión"
            ) { success, error in

                DispatchQueue.main.async {

                    if success {
                        print("Face ID correcto")

                        self.performSegue(
                            withIdentifier: "showHome",
                            sender: self
                        )

                    } else {
                        print("Face ID no reconocido")
                    }
                }
            }

        } else {
            print("Autenticación biométrica no disponible")
            print("Error: \(error?.localizedDescription ?? "Desconocido")")
            print("Código del error: \(error?.code ?? -1)")
        }
    }
    
    
    func setErrorBorder(for textField: UITextField, show: Bool) {
        if show {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
        } else {
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.layer.borderWidth = 0.0
        }
    }


    
    override func viewDidLoad() {
        
        // MARK: - Recuperar datos del registro

        // Leer los datos guardados con UserDefaults
        let registeredName = UserDefaults.standard.string(
            forKey: "registeredName"
        ) ?? "Sin registrar"

        let registeredUsername = UserDefaults.standard.string(
            forKey: "registeredUsername"
        ) ?? "Sin registrar"

        // Mostrar los datos recuperados en la consola
        print("Nombre registrado: \(registeredName)")
        print("Usuario registrado: \(registeredUsername)")

        super.viewDidLoad()
        print("\(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(#function)")
        // MARK: - Mensaje de bienvenida
        // Recuperar el nombre guardado durante el registro
        let registeredName = UserDefaults.standard.string(
            forKey: "registeredName"
        ) ?? ""
        // Mostrar el nombre si existe un usuario registrado
        if registeredName.isEmpty {
            welcomeLabel.text = "Bienvenido"
        } else {
            welcomeLabel.text = "Bienvenido, \(registeredName)"
        }
    }


    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print("\(#function)")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("\(#function)")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("\(#function)")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(#function)")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(#function)")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(#function)")
    }
    override func viewWillTransition(
        to size: CGSize,
        with coordinator: UIViewControllerTransitionCoordinator
    ) {
        super.viewWillTransition(to: size, with: coordinator)
        print("\(#function)")
    }
    deinit {
        print("\(#function)")
    }
}

