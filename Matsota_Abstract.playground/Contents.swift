import UIKit

struct User {
    
    /// - Implementation
    let uuid: String
    var defaults: Defaults
    
    struct Defaults {
        let name: String
        let gender: Gender
        let birthDate: String
    }
    
    enum Gender {
        case male
        case female
    }
    
    /// - Action
    func someAction() { }
    
    func checkSomeActionPermission() -> Bool {
        return someActionPermission
    }
    
    mutating func change(action statement: Bool) {
        someActionPermission = statement
    }
    
    /// - Defaults
    func checkPublic() -> Bool {
        return defaultsIsPublic
    }

    func readDefaults() -> Defaults {
        return defaults
    }
    
    mutating func change(defaults model: Defaults) {
        defaults = model
        saveChanges()
    }
    
    mutating func change(public statement: Bool) {
        defaultsIsPublic = statement
    }
    
    /// - Private Implementation
    private func saveChanges() { }
    
    private var someActionPermission: Bool = false {
        didSet {
            saveChanges()
        }
    }
    
    private var defaultsIsPublic: Bool = false {
        didSet {
            saveChanges()
        }
    }
}


struct UserList {
    
    /// - Implementation
    let users: [User]
        
    /// - User Abilities
    func performSomeAction(for uuid: String,
                           success: @escaping() -> Void,
                           failure: @escaping(CustomErrors) -> Void) {
        guard var certainUser = userRequest(with: uuid) else {return failure(.no_user)}
        
        switch certainUser.checkSomeActionPermission() {
        case true:
            certainUser.someAction()
            success()
        
        case false:
            grantSomeActionPermition(for: certainUser.uuid) { permissionGranted in
                let didGrant: (() -> Void) = {
                    certainUser.change(action: true)
                    performSomeAction(for: certainUser.uuid, success: success, failure: failure)
                }
                
                permissionGranted ? didGrant() : failure(.permission_denied)
            }
        }
    }
    func changeActionPermissionRequest(for uuid: String) {
        guard var certainUser = userRequest(with: uuid) else {return}
        certainUser.change(public: !certainUser.checkSomeActionPermission())
    }
    
    /// - User Data
    func userRequest(with uuid: String) -> User? {
        return users.first(where: {$0.uuid == uuid})
    }
    
    func readUserDefaultsRequest(with uuid: String,
                          success: @escaping(User.Defaults) -> Void,
                          failure: @escaping(CustomErrors) -> Void) {
        guard let certainUser = userRequest(with: uuid) else {return failure(.no_user)}
        certainUser.checkPublic() ? success(certainUser.defaults) : failure(.permission_denied)
    }
    
    func updateRequest(ceratain user: User,
                success: @escaping() -> Void,
                failure: @escaping(CustomErrors) -> Void) {
        guard var certainUser = userRequest(with: user.uuid) else {return failure(.no_user)}
        certainUser.change(defaults: user.defaults)
        success()
    }
    
    func changePublicRequest(for uuid: String) {
        guard var certainUser = userRequest(with: uuid) else {return}
        certainUser.change(public: !certainUser.checkPublic())
    }

    /// - Private Implementation
    private func grantSomeActionPermition(for uuid: String,
                                completion: @escaping(Bool) -> Void) {
        let permissionGranded = Bool()
        
        completion(permissionGranded)
    }
}

enum CustomErrors: Error {
    case no_user
    case permission_denied
}
