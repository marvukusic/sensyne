//
//  HospitalsViewModel.swift
//  SensyneTechTest
//
//  Created by Marko Vukusic on 07/10/2020.
//

import Foundation

class HospitalsViewModel {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadData() -> [HospitalModel] {
        return networkService.getHospitalList()
    }
}
