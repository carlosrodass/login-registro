//
//  ErrorResponse.swift
//  loginRegister
//
//  Created by alumnos on 04/02/2021.
//

import Foundation

struct ErrorResponse: Decodable, LocalizedError{
    let reason : String
    var errorDescription: String? {return reason}
}
    

