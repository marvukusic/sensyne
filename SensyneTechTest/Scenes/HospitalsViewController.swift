//
//  HospitalsViewController.swift
//  SensyneTechTest
//
//  Created by Marko Vukusic on 07/10/2020.
//

import UIKit

class HospitalsViewController: UIViewController {
    
    var viewModel: HospitalsViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterSwitch: UISwitch!
    
    var hospitals = [HospitalModel]()
    
    var hospitalsFiltered: [HospitalModel] {
        return filterNhsOnly ? hospitals.filter({$0.sector == "NHS Sector"}) : hospitals
    }
    
    private var filterNhsOnly = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle()
        loadData()
    }

    private func setTitle() {
        title = "Hospital list"
    }
    
    private func loadData() {
        hospitals = viewModel?.loadData() ?? []
        tableView.reloadData()
    }
    
    @IBAction func filterSwitchValueChanged(_ sender: Any) {
        filterNhsOnly = filterSwitch.isOn
        tableView.reloadData()
    }
}

extension HospitalsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hospitalsFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = hospitalsFiltered[indexPath.row].organisationName
        cell.detailTextLabel?.text = hospitalsFiltered[indexPath.row].sector
        return cell
    }
}

extension HospitalsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
