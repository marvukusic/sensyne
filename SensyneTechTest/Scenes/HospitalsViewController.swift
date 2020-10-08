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
    @IBOutlet weak var filterLabel: UILabel!
    
    var hospitals = [HospitalModel]()
    
    var hospitalsFiltered: [HospitalModel] {
        return filterNhsOnly ? hospitals.filter({$0.sector == "NHS Sector"}) : hospitals
    }
    
    private var filterNhsOnly = false
    private var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle()
        loadData()
        setXcTestData()
    }
    
    private func setXcTestData() {
        view.accessibilityIdentifier = "hospitalList"
        tableView.accessibilityIdentifier = "hospitalListTableView"
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
        filterLabel.text = filterSwitch.isOn ? "NHS only" : "No filter"
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? HospitalDetailsViewController else { return }
        viewController.hospital = hospitalsFiltered[selectedIndex]
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
        cell.accessibilityIdentifier = "hospitalListTableViewCell_\(indexPath.row)"
        return cell
    }
}

extension HospitalsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "showDetails", sender: self)
    }
}
