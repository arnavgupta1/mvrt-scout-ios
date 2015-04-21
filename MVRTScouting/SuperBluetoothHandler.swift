//
//  SuperBluetoothHandler.swift
//  MVRTScouting
//
//  Created by Alex Erf on 3/29/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import CoreBluetooth

private let _SuperBluetoothInstance = SuperBluetoothHandler()

class SuperBluetoothHandler: NSObject, CBCentralManagerDelegate {
    
    private var manager : CBCentralManager!
    private var shouldStartConnecting : Bool
    private var notificationCenter : NSNotificationCenter
    
    override init() {
        shouldStartConnecting = false
        notificationCenter = NSNotificationCenter()
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
   
    class var sharedInstance : SuperBluetoothHandler {
        return _SuperBluetoothInstance
    }
    
    func addConnectionObserver(observer : (NSNotification!) -> ()) -> AnyObject {
        return notificationCenter.addObserverForName("Add Peripheral", object: nil, queue: nil, usingBlock: observer)
    }
    
    func addConnectionStatusObserver(observer : (NSNotification!) -> ()) -> AnyObject {
        return notificationCenter.addObserverForName("Peripheral Connection", object: nil, queue: nil, usingBlock: observer)
    }
    
    func removeConnectionObserver(observer : AnyObject) {
        notificationCenter.removeObserver(observer)
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        switch central.state {
        case .Unsupported: fallthrough
        case .Unauthorized: fallthrough
        case .PoweredOff:
            terminateConnections()
        case .PoweredOn:
            if shouldStartConnecting {
                startConnecting()
            }
        default:
            return
        }
    }
    
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!) {
        println(peripheral)
        notificationCenter.postNotificationName("Add Peripheral", object: nil, userInfo: ["Peripheral" : peripheral])
    }
    
    func centralManager(central: CBCentralManager!, didFailToConnectPeripheral peripheral: CBPeripheral!, error: NSError!) {
        println("Failed to connect to \(peripheral)")
        notificationCenter.postNotificationName("Peripheral Connection", object: nil, userInfo: ["Success" : false])
    }
    
    func centralManager(central: CBCentralManager!, didConnectPeripheral peripheral: CBPeripheral!) {
        println("Connected to \(peripheral)")
        notificationCenter.postNotificationName("Peripheral Connection", object: nil, userInfo: ["Success" : true])
    }
    
    func startConnecting() {
        shouldStartConnecting = true
        if manager.state == .PoweredOn {
            manager.scanForPeripheralsWithServices([ScoutServices.scout_service], options: nil)
        }
    }
    
    func terminateConnections() {
        shouldStartConnecting = false
        manager.stopScan()
    }
    
    func connectToPeripheral(peripheral: CBPeripheral) {
        manager.connectPeripheral(peripheral, options: nil)
    }
    
}
