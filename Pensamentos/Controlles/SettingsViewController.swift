//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Marcio Abrantes on 12/08/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var swAutoreRefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    let configuration = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    private func formatView() {
        swAutoreRefresh.setOn(configuration.autoRefresh, animated: false)
        slTimeInterval.setValue(Float(configuration.timeInterval), animated: false)
        scColorScheme.selectedSegmentIndex = configuration.colorScheme
        changeTimeIntervalLabel(with: configuration.timeInterval)
    }
    
    private func changeTimeIntervalLabel(with value: Double) {
        let valueInTextToInt = Int(value)
        lbTimeInterval.text = "Mudar após \(valueInTextToInt) segundos"
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        configuration.autoRefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        configuration.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        configuration.colorScheme = sender.selectedSegmentIndex
    }
    
}
