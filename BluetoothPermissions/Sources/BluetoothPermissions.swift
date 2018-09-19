//
//  BluetoothServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreBluetooth

public protocol BluetoothPermissions {
    
    typealias PermissionsState = (authStatus: CBPeripheralManagerAuthorizationStatus, state: CBManagerState)
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void)
    func permissionsState() -> PermissionsState
    
}

open class DefaultBluetoothPermissions: NSObject, BluetoothPermissions {

    private var bluetoothManager: CBPeripheralManager?
    private var requestPermissionsHandler: ((PermissionsState) -> Void)?
    
    public func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        requestPermissionsHandler = handler
        bluetoothManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    public func permissionsState() -> PermissionsState {
        return (CBPeripheralManager.authorizationStatus(), bluetoothManager?.state ?? .poweredOff)
    }
    
}

// MARK: - CBCentralManagerDelegate -

extension DefaultBluetoothPermissions: CBPeripheralManagerDelegate {
    
    public func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.requestPermissionsHandler?(self.permissionsState())
        }
    }
    
}
