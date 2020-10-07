//
//  HospitalsViewController.swift
//  SensyneTechTest
//
//  Created by Marko Vukusic on 07/10/2020.
//

import UIKit

class HospitalsViewController: UIViewController {
    
    var viewModel: HospitalsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle()
        loadData()
    }

    private func setTitle() {
        title = "Hospital list"
    }
    
    private func loadData() {
        viewModel?.loadData()
    }

}

