
import Foundation

class UserViewModel {

    func validateUser(user: User) -> Bool {

        if user.userName.isEmpty || user.password.isEmpty {
            return false
        }

        return true
    }
}
