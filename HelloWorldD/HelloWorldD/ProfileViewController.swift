
import UIKit
import AVKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let savedUsername = UserDefaults.standard.string(forKey: "username") ?? ""

        print("Usuario guardado: \(savedUsername)")
    }

    @IBAction func videoTapped(_ sender: UIBarButtonItem) {

        print("Botón Video presionado")

        let url = URL(string: "https://remotion.media/video.mp4")!

        let player = AVPlayer(url: url)

        let playerController = AVPlayerViewController()
        playerController.player = player

        present(playerController, animated: true) {
            player.play()
        }
    }

    @IBAction func deleteUserTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "username")
        print("Usuario eliminado correctamente")
        let savedUsername = UserDefaults.standard.string(forKey: "username")
        print("Usuario actual: \(savedUsername ?? "Sin guardar")")
    }

    
    @IBAction func photoTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {

        if let selectedImage = info[.originalImage] as? UIImage {
            image.image = selectedImage
        }

        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(
        _ picker: UIImagePickerController
    ) {
        picker.dismiss(animated: true)
    }



    
}
