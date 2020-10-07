//
//  HospitalModel.swift
//  SensyneTechTest
//
//  Created by Marko Vukusic on 07/10/2020.
//

import Foundation

struct HospitalModel {
    let organisationID           : String
    let organisationCode         : String
    let organisationType         : String
    let subType                  : String
    let sector                   : String
    let organisationStatus       : String
    let isPimsManaged            : String
    let organisationName         : String
    let address1                 : String
    let address2                 : String
    let address3                 : String
    let city                     : String
    let county                   : String
    let postcode                 : String
    let latitude                 : String
    let longitude                : String
    let parentODSCode            : String
    let parentName               : String
    let phone                    : String
    let email                    : String
    let website                  : String
    let fax                      : String
    
    init(stringArray: [String]) {
        self.organisationID           = stringArray[0]
        self.organisationCode         = stringArray[1]
        self.organisationType         = stringArray[2]
        self.subType                  = stringArray[3]
        self.sector                   = stringArray[4]
        self.organisationStatus       = stringArray[5]
        self.isPimsManaged            = stringArray[6]
        self.organisationName         = stringArray[7]
        self.address1                 = stringArray[8]
        self.address2                 = stringArray[9]
        self.address3                 = stringArray[10]
        self.city                     = stringArray[11]
        self.county                   = stringArray[12]
        self.postcode                 = stringArray[13]
        self.latitude                 = stringArray[14]
        self.longitude                = stringArray[15]
        self.parentODSCode            = stringArray[16]
        self.parentName               = stringArray[17]
        self.phone                    = stringArray[18]
        self.email                    = stringArray[19]
        self.website                  = stringArray[20]
        self.fax                      = stringArray[21]
    }
}
