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
    static let auton_service = CBUUID(string: "A5C3367E-783A-4CD5-91E8-2F4AB4E144A5")
    static let teleop_service = CBUUID(string: "D770B1AC-BA17-418E-8DB0-4FE4F8E416E0")
    static let postgame_service = CBUUID(string: "72AAB064-825A-4B42-8C63-5EB0AB727365")
    static let auton_characteristic = CBUUID(string: "1143A891-1EE6-4ABA-B4E4-B88712AD170C")
    static let teleop_characteristic = CBUUID(string: "49DA6A3C-FE2D-486C-A989-CD5608FE69A6")
    static let postgame_characteristic = CBUUID(string: "DA648E12-200D-4BAC-AE3A-91FCE8692C39")
}

private let _SubBluetoothInstance = SubScoutBluetoothHandler()

class SubScoutBluetoothHandler: NSObject, CBPeripheralManagerDelegate {
    
    private var manager : CBPeripheralManager!
    private var mainService : CBMutableService
    private var autonService : CBMutableService
    private var teleopService : CBMutableService
    private var postgameService : CBMutableService
    private var autonCharacteristic : CBMutableCharacteristic
    private var teleopCharacteristic : CBMutableCharacteristic
    private var postgameCharacteristic : CBMutableCharacteristic
    private var shareQueue : Stack<(CBMutableCharacteristic, NSData)>
    private var shouldConnect : Bool
    private var isReady = true
    
    override init() {
        shouldConnect = false
        mainService = CBMutableService(type: ScoutServices.scout_service, primary: true)
        autonService = CBMutableService(type: ScoutServices.auton_service, primary: true)
        teleopService = CBMutableService(type: ScoutServices.teleop_service, primary: true)
        postgameService = CBMutableService(type: ScoutServices.postgame_service, primary: true)
        var autonStruct = AutonData()
        autonCharacteristic = CBMutableCharacteristic(type: ScoutServices.auton_characteristic, properties: CBCharacteristicProperties.Read | CBCharacteristicProperties.Notify, value: nil, permissions: CBAttributePermissions.Readable)
        autonService.characteristics = [autonCharacteristic]
        
        var teleopStruct = TeleopData()
        teleopCharacteristic = CBMutableCharacteristic(type: ScoutServices.teleop_characteristic, properties: CBCharacteristicProperties.Read | CBCharacteristicProperties.Notify, value: nil, permissions: CBAttributePermissions.Readable)
        teleopService.characteristics = [teleopCharacteristic]
        
        var postgameStruct = PostgameData()
        postgameCharacteristic = CBMutableCharacteristic(type: ScoutServices.postgame_characteristic, properties: CBCharacteristicProperties.Read | CBCharacteristicProperties.Notify, value: nil, permissions: CBAttributePermissions.Readable)
        postgameService.characteristics = [postgameCharacteristic]
        
        shareQueue = Stack<(CBMutableCharacteristic, NSData)>()
        super.init()
        manager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
    }
    
    class var sharedInstance : SubScoutBluetoothHandler {
        return _SubBluetoothInstance
    }
    
    func createServiceTree() {
        manager.addService(mainService)
        manager.addService(autonService)
        manager.addService(teleopService)
        manager.addService(postgameService)
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        switch peripheral.state {
        case .Unsupported: fallthrough
        case .Unauthorized: fallthrough
        case .PoweredOff:
            terminateConnections()
        case .PoweredOn:
            if shouldConnect {
                createServiceTree()
                startConnecting()
            }
        default:
            return
        }
    }
    
    func startConnecting() {
        shouldConnect = true
        if manager.state == .PoweredOn {
            manager.startAdvertising([CBAdvertisementDataServiceUUIDsKey : [mainService.UUID, autonService.UUID, teleopService.UUID, postgameService.UUID], CBAdvertisementDataLocalNameKey : UIDevice.currentDevice().name])
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
    
    func peripheralManager(peripheral: CBPeripheralManager!, central: CBCentral!, didSubscribeToCharacteristic characteristic: CBCharacteristic!) {
        println("Central: \(central) subscribed to characteristic: \(characteristic.UUID)")
        self.test(3)
        //self.test(7)
    }
    
    func peripheralManagerIsReadyToUpdateSubscribers(peripheral: CBPeripheralManager!) {
        isReady = true
        println("READY")
        pushData()
    }
    
    func shareData(ch : CBMutableCharacteristic, data: NSData) {
        shareQueue.push((ch, data))
        pushData()
    }
    
    func pushData() {
        if !isReady {
            println("NOT READY YET")
            return
        }
        if !shareQueue.empty {
            let (ch, dat) = shareQueue.pop()!
            isReady = false
            var success = manager.updateValue(dat, forCharacteristic: ch, onSubscribedCentrals: nil)
            if !success {
                println("FAILED TO UPDATE VALUES")
            }
        }
    }
    var hasRun = false
    func test(i : Int) {
        if (hasRun) {
            return
        }
        hasRun = true
        var auton = AutonData()
        auton.cansFromStep = false
        auton.startPlace = .StgArea
        
        var teleop = TeleopData()
        teleop.noodlesToLandfill = i
        
        shareData(autonCharacteristic, data: NSData(bytes: &auton, length: sizeof(AutonData)))
        shareData(teleopCharacteristic, data: NSData(bytes: &teleop, length: sizeof(TeleopData)))
    }

}

struct Stack<T> {
    
    var elements = Array<T>()
    
    var empty : Bool {
        return elements.count == 0
    }
    
    mutating func push(elem : T) {
        elements.append(elem)
    }
    
    mutating func pop() -> T? {
        if !empty {
            return elements.removeLast()
        }
        return nil
    }
}
