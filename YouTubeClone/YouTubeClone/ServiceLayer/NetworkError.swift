//
//  NetworkError.swift
//  YouTubeClone
//
//  Created by Byron Guzman on 3/15/23.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "Ocurrio un error al tratar de consultar a la api: status code"
    case jsonDecoder = "Error al intentar de extraer datos de json."
    case anauthorized
}
