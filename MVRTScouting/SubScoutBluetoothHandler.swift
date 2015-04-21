//
//  SubScoutBluetoothHandler.swift
//  MVRTScouting
//
//  Created by Alex Erf on 4/1/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import CoreBluetooth
import UIKit

struct ScoutServices {
    static let scout_service = CBUUID(string: "1815AE76-7F61-49A5-B9D1-937686835D76")
}

private let _SubBluetoothInstance = SubScoutBluetoothHandler()

class SubScoutBluetoothHandler: NSObject, CBPeripheralManagerDelegate {
    
    private var manager : CBPeripheralManager!
    private var service : CBMutableService
    private var shouldConnect : Bool
    
    override init() {
        shouldConnect = false
        service = CBMutableService(type: ScoutServices.scout_service, primary: true)
        super.init()
        manager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
        manager.addService(service)
    }
    
    class var sharedInstance : SubScoutBluetoothHandler {
        return _SubBluetoothInstance
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        switch peripheral.state {
        case .Unsupported: fallthrough
        case .Unauthorized: fallthrough
        case .PoweredOff:
            terminateConnections()
        case .PoweredOn:
            if shouldConnect {
                startConnecting()
            }
        default:
            return
        }
    }
    
    func startConnecting() {
        shouldConnect = true
        if manager.state == .PoweredOn {
            manager.startAdvertising([CBAdvertisementDataServiceUUIDsKey : [service.UUID], CBAdvertisementDataLocalNameKey : UIDevice.currentDevice().name])
        }
    }
    
    func terminateConnections() {
        shouldConnect = false
        manager.stopAdvertising()
    }
    
    func peripheralManager(peripheral: CBPeripheralManager!, didAddService service: CBService!, error: NSError!) {
        println("ADDED SERVICE: \(service)")
        if let e = error {
            println("ERROR : \(e)")
        }
    }
    
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager!, error: NSError!) {
        println("STARTED ADVERTISING: \(peripheral)")
        if let e = error {
            println("ERROR : \(e)")
        }
    }

}
