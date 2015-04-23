//
//  SuperBluetoothHandler.swift
//  MVRTScouting
//
//  Created by Alex Erf on 3/29/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import CoreBluetooth

private let _SuperBluetoothInstance = SuperBluetoothHandler()

class SuperBluetoothHandler: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    private var manager : CBCentralManager!
    private var shouldStartConnecting : Bool
    private var notificationCenter : NSNotificationCenter
    private var data : Dictionary<CBPeripheral, ScoutingData>
    
    override init() {
        shouldStartConnecting = false
        notificationCenter = NSNotificationCenter()
        data = Dictionary<CBPeripheral, ScoutingData>()
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
        peripheral.delegate = self
        if data[peripheral] == nil {
            data[peripheral] = ScoutingData()
        }
        println("Searching for services")
        peripheral.discoverServices([ScoutServices.auton_service, ScoutServices.teleop_service, ScoutServices.postgame_service])
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
    
    func peripheral(peripheral: CBPeripheral!, didDiscoverServices error: NSError!) {
        if let err = error {
            println("Error discovering services : \(err.localizedDescription)")
        }
        for service in peripheral.services {
            println("Discovered service : \(service.UUID)")
            peripheral.discoverCharacteristics([ScoutServices.auton_characteristic, ScoutServices.teleop_characteristic, ScoutServices.postgame_characteristic], forService: service as! CBService)
        }
    }
    
    func peripheral(peripheral: CBPeripheral!, didDiscoverCharacteristicsForService service: CBService!, error: NSError!) {
        if let err = error {
            println("Error discovering services : \(err.localizedDescription)")
        }
        for characteristic in service.characteristics {
            println("Discovered characteristic for service: \(service.UUID)\n\tcharacteristic: \(characteristic.UUID)")
            if (characteristic.UUID == ScoutServices.auton_characteristic ||
                characteristic.UUID == ScoutServices.teleop_characteristic ||
                characteristic.UUID == ScoutServices.postgame_characteristic) {
                peripheral.setNotifyValue(true, forCharacteristic: characteristic as! CBCharacteristic)
            }
        }
    }
    
    func peripheral(peripheral: CBPeripheral!, didUpdateNotificationStateForCharacteristic characteristic: CBCharacteristic!, error: NSError!) {
        if let err = error {
            println("Error subscribing to characteristic : \(err)")
        }
        else {
            println("Subscribed to characteristic : \(characteristic.UUID)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral!, didUpdateValueForCharacteristic characteristic: CBCharacteristic!, error: NSError!) {
        let data = characteristic.value
        if characteristic.UUID == ScoutServices.auton_characteristic {
            var auton = AutonData()
            data.getBytes(&auton, length: sizeof(AutonData))
            self.data[peripheral]?.auton = auton
        }
        if characteristic.UUID == ScoutServices.teleop_characteristic {
            var teleop = TeleopData()
            data.getBytes(&teleop, length: sizeof(TeleopData))
            self.data[peripheral]?.teleop = teleop
        }
        if characteristic.UUID == ScoutServices.postgame_characteristic {
            var postgame = PostgameData()
            data.getBytes(&postgame, length: sizeof(PostgameData))
            self.data[peripheral]?.postgame = postgame
        }
        println(self.data[peripheral]!.auton.cansFromStep)
        println(self.data[peripheral]!.auton.interferes)
        println(self.data[peripheral]!.teleop.noodlesToLandfill)
    }
    
}
