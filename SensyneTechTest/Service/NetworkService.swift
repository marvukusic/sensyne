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
    
    typealias QueryResult = ([HospitalModel]) -> Void
    
    func getHospitalList(completion: @escaping QueryResult) {
        if let url = URL(string: "http://media.nhschoices.nhs.uk/data/foi/Hospital.csv") {
            do {
                let data = try String(contentsOf: url, encoding: .ascii)
                let hospitals = parseCsv(data)
                completion(hospitals)
                return
            } catch {
                let data = getFileData(file: "Hospitals", type: "csv")
                let hospitals = parseCsv(data)
                return completion(hospitals)
            }
        } else {
            return completion([])
        }
    }
    
    private func parseCsv(_ data: String?) -> [HospitalModel] {
        guard let data = data else { return [] }
        var hospitals: [HospitalModel] = []
        let lines = data.split(separator: "\r\n")
        for (index, line) in lines.enumerated() where index != 0 {
            let hospitalsArray = line.components(separatedBy: "¬")
            let hospitalModel = HospitalModel(stringArray: hospitalsArray)
            hospitals.append(hospitalModel)
        }
        return hospitals
    }
    
    private func getFileData(file: String, type: String) -> String? {
        guard let filepath = Bundle.main.path(forResource: file, ofType: type) else { return nil }
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .ascii)
            return contents
        } catch {
            return nil
        }
    }
}
