import UIKit
import LocalAuthentication

class MainViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let viewModel = UserViewModel()
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {

        print("BOTÓN PRESIONADO")

        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        let user = User(
            name: "",
            userName: username,
            password: password
        )

        if viewModel.validateUser(user: user) {
            print("Login válido")
            UserDefaults.standard.set(username, forKey: "username")
            performSegue(withIdentifier: "showHome", sender: self)
        } else {
            print("Completa todos los campos")
        }
    }
    
    @IBAction func faceIDTapped(_ sender: UIButton) {

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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#function)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(#function)")
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

