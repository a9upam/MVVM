//
//  SettingsViewModelsTest.swift
//  GoodWeatherAppTests
//
//  Created by Anupam G on 06/07/22.
//

import XCTest
@testable import GoodWeatherApp

class SettingsViewModelsTest: XCTestCase {

    private var settingsViewModel : SettingsViewModel = SettingsViewModel()
    
    override class func setUp() {
        super.setUp()
    }
    func test_shouldMakeSureThatSelectedUnitIsFarhanhit(){
        XCTAssertEqual(settingsViewModel.selectedUnit, .celsius)
    }
    
    func test_DisplayName(){
        XCTAssertEqual(settingsViewModel.selectedUnit.displayName, "Celcius")
    }
    
    func test_save(){
        self.settingsViewModel.selectedUnit = .celsius
        let userDefault = UserDefaults.standard
        XCTAssertNotNil(userDefault.value(forKey:"unit"))
    }
    
    
    override class func tearDown() {
        super.tearDown()
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "unit")
    }
}
