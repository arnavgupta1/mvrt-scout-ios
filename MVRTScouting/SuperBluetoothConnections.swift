//
//  SuperBluetoothConnections.swift
//  MVRTScouting
//
//  Created by Alex Erf on 4/1/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import UIKit
import CoreBluetooth

class BluetoothEntity {
    var peripheral : CBPeripheral
    var isConnecting = false
    var isConnected = false
    
    init(peripheral: CBPeripheral) {
        self.peripheral = peripheral
    }
    
}

class SuperBluetoothConnections: UITableViewController {
    
    private var discoveredConnections = [BluetoothEntity]()
    private var currentConnections = [BluetoothEntity]()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        SuperBluetoothHandler.sharedInstance.addConnectionObserver {
            let userInfo = $0.userInfo as! Dictionary<String, CBPeripheral>
            self.addPeripheral(userInfo["Peripheral"]!)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.contentInset = UIEdgeInsetsMake(0, 0, self.bottomLayoutGuide.length, 0)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell_id = "connection"
        let cell = tableView.dequeueReusableCellWithIdentifier(cell_id, forIndexPath: indexPath) as! BluetoothConnectionCell
        let peripheralData = (indexPath.section == 0 ? discoveredConnections[indexPath.row] : currentConnections[indexPath.row])
        cell.name = peripheralData.peripheral.name
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return discoveredConnections.count
        case 1:
            return currentConnections.count
        default:
            return 0
        }
    }
    
    func addPeripheral(peripheral : CBPeripheral) {
        for p in discoveredConnections {
            if p.peripheral.identifier == peripheral.identifier {
                return
            }
        }
        for p in currentConnections {
            if p.peripheral.identifier == peripheral.identifier {
                return
            }
        }
        discoveredConnections.append(BluetoothEntity(peripheral: peripheral))
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
        tableView.endUpdates()
    }
    
    func removePeripheral(peripheral : CBPeripheral) {
        discoveredConnections = discoveredConnections.filter {
            $0.peripheral != peripheral
        }
        currentConnections = currentConnections.filter {
            $0.peripheral != peripheral
        }
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            return
        }
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! BluetoothConnectionCell
        cell.startSpin()
        weak var observer: AnyObject?
        observer = SuperBluetoothHandler.sharedInstance.addConnectionStatusObserver {
            let userInfo = $0.userInfo as! Dictionary<String, Bool>
            if let success = userInfo["Success"] {
                if success {
                    cell.stopSpin()
                    
                    cell.backgroundColor = UIColor.whiteColor()
                    tableView.beginUpdates()
                    let peripheralData = self.discoveredConnections[indexPath.row]
                    self.removePeripheral(peripheralData.peripheral)
                    self.currentConnections.append(peripheralData)
                    
                    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                    tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 1)], withRowAnimation: UITableViewRowAnimation.Fade)
                    tableView.endUpdates()
                }
            }
            SuperBluetoothHandler.sharedInstance.removeConnectionObserver(observer!)
        }
        SuperBluetoothHandler.sharedInstance.connectToPeripheral(discoveredConnections[indexPath.row].peripheral)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = UILabel()
        title.text = (section == 0 ? " Discovered Devices" : " Current Connections")
        title.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        title.backgroundColor = Colors.Purple.toColor()
        title.textColor = Colors.Gold.toColor()
        return title
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }

}

class BluetoothConnectionCell: UITableViewCell {
    
    internal var name : String? {
        set {
            nameLabel.text = newValue
        }
        get {
            return nameLabel.text
        }
    }
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var spinnerView: UIActivityIndicatorView!
    
    func startSpin() {
        spinnerView.startAnimating()
    }
    
    func stopSpin() {
        spinnerView.stopAnimating()
    }
    
}