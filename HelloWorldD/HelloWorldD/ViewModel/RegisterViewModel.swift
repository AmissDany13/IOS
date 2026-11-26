
import Foundation

class RegisterViewModel {
    func validateUsername(_ username: String) -> String? {

        if username.isEmpty {
            return "El usuario es obligatorio"
        }

        if username.count < 4 || username.count > 20 {
            return "Debe tener entre 4 y 20 caracteres"
        }

        if username.contains(where: { !$0.isLetter && !$0.isNumber }) {
            return "No se permiten espacios ni caracteres especiales"
        }

        if username.first?.isNumber == true {
            return "El usuario no puede iniciar con un número"
        }

        return nil
    }
    
    func validateName(_ name: String) -> String? {

        let nombre = name.trimmingCharacters(in: .whitespacesAndNewlines)

        if nombre.isEmpty {
            return "El nombre es obligatorio"
        }

        if nombre.count < 2 {
            return "Nombre demasiado corto"
        }

        if nombre.count > 30 {
            return "El nombre no puede superar los 30 caracteres"
        }

        if nombre.contains(where: { !$0.isLetter && $0 != " " }) {
            return "Solo se permiten letras"
        }

        return nil
    }
    
    func validateLastName(_ lastName: String) -> String? {

        let apellido = lastName.trimmingCharacters(in: .whitespacesAndNewlines)

        if apellido.isEmpty {
            return "El apellido es obligatorio"
        }

        if apellido.count < 2 {
            return "Apellido demasiado corto"
        }

        if apellido.count > 30 {
            return "El apellido no puede superar los 30 caracteres"
        }

        if apellido.contains(where: { !$0.isLetter && $0 != " " }) {
            return "Solo se permiten letras"
        }

        return nil
    }
    
    func validatePassword(_ password: String) -> String? {

        if password.isEmpty {
            return "La contraseña es obligatoria"
        }

        if password.count < 8 {
            return "Debe tener al menos 8 caracteres"
        }

        if password.contains(where: { $0.isWhitespace }) {
            return "La contraseña no debe contener espacios"
        }

        let tieneMayuscula = password.contains(where: { $0.isUppercase })
        let tieneMinuscula = password.contains(where: { $0.isLowercase })
        let tieneNumero = password.contains(where: { $0.isNumber })

        if !tieneMayuscula || !tieneMinuscula || !tieneNumero {
            return "Debe incluir mayúsculas, minúsculas y números"
        }

        return nil
    }
    
    func validateConfirmPassword(
        _ confirmPassword: String,
        password: String
    ) -> String? {

        if confirmPassword.isEmpty {
            return "Debes confirmar la contraseña"
        }

        if confirmPassword != password {
            return "Las contraseñas no coinciden"
        }

        return nil
    }
}
