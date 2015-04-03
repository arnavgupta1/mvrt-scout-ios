//
//  SubScoutBluetoothHandler.swift
//  MVRTScouting
//
//  Created by Alex Erf on 4/1/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import CoreBluetooth

struct ScoutServices {
    static let scout_service = CBUUID(string: "1815AE76-7F61-49A5-B9D1-937686835D76")
}

private let _SubBluetoothInstance = SubScoutBluetoothHandler()

class SubScoutBluetoothHandler: NSObject, CBPeripheralManagerDelegate {
    
    private var manager : CBPeripheralManager!
    private let service_id = ScoutServices.scout_service
    private var shouldConnect : Bool
    
    override init() {
        shouldConnect = false
        super.init()
        manager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
    }
    
    class var sharedInstance : SubScoutBluetoothHandler {
        return _SubBluetoothInstance
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        switch peripheral.state {
        case .Unsupported: fallthrough
        case .Unauthorized: fallthrough
        case .PoweredOff: break
           // terminateConnections()        TODO
        case .PoweredOn: break
         //   if shouldStartConnecting {    TODO
            //    startConnecting()         TODO
           // }
        default:
            return
        }
    }
    
    func startConnecting() {
        shouldConnect = true
        if manager.state == .PoweredOn {
            manager.startAdvertising(nil) // <- change
        }
    }
    
    func terminateConnections() {
        shouldConnect = false
        manager.stopAdvertising()
    }

}
