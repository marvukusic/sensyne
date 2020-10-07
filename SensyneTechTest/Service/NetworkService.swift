//
//  NetworkService.swift
//  SensyneTechTest
//
//  Created by Marko Vukusic on 07/10/2020.
//

import Foundation

class NetworkService {
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    typealias QueryResult = ([HospitalModel], Error?) -> Void
    
    func getHospitalList(completion: @escaping QueryResult) {
        dataTask?.cancel()
        guard let urlComponents = URLComponents(string: "http://media.nhschoices.nhs.uk/data/foi/Hospital.csv"),
              let url = urlComponents.url else { return }
  
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer { self?.dataTask = nil }
            
            if let error = error {
                completion([], error)
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                let hospitals = self?.parseCsv(data) ?? []
                DispatchQueue.main.async {
                    completion(hospitals, nil)
                }
            }
        }
        dataTask?.resume()
    }
    
    private func parseCsv(_ data: Data) -> [HospitalModel] {
        return []
    }
}
