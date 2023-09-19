//
//  AuthMan.swift
//  Test1
//
//  Created by Prince Yadav on 19/09/23.
//
import FirebaseAuth
import Foundation

class AuthMan {
    static let shared = AuthMan()
    
    private var verificationId: String?
    
    private let auth = Auth.auth()
    
    public func startAuth(phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] verificationId, error in
            guard let verificationId = verificationId,error == nil else {
                completion(false)
            return
            }
            self?.verificationId = verificationId
            completion(true)
        }
    }
    public func verifyCode(smsCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationId = verificationId else {
            completion(false)
            return
        }
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: smsCode
        )
        auth.signIn(with: credential) {
            result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
}
