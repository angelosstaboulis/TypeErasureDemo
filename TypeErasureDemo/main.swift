//
//  main.swift
//  TypeErasureDemo
//
//  Created by Angelos Staboulis on 3/5/24.
//

import Foundation
protocol Vehicle{
    func start()
    func stop()
}
class Car:Vehicle{
    func start() {
        print("Start Car...........")
    }
    func stop(){
        print("Stop Car")
    }
}
class MotorVehicle:Vehicle{
    func start(){
        print("Start MotorCycle........")
    }
    func stop(){
        print("Stop MotorCycle..........")
    }
}
class AnyVehicle{
    private var _start:()->Void
    private var _stop:()->Void
    init<T:Vehicle>(vehicle:T){
        _start = vehicle.start
        _stop = vehicle.stop
    }
    func start(){
        _start()
    }
    func stop(){
        _stop()
    }
}
var car = Car()
var motorVehicle = MotorVehicle()
var vehicleCar = AnyVehicle(vehicle: car)
var vehicleMotor = AnyVehicle(vehicle: motorVehicle)
vehicleCar.start()
vehicleMotor.start()
vehicleCar.stop()
vehicleMotor.stop()
