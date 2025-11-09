//
//  LoginViewUITests.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 09/11/25.
//

import XCTest

final class LoginViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append("UI-TESTING")
        app.launch()
    }
    
    func testLoginButtonIsDisableWhenFieldsEmpty(){
        // aku coba check tombol Masuk ada di layar
        let loginButton = app.buttons["Masuk"]
        XCTAssertTrue(loginButton.exists,"Tombol Masuk tidak ditemukan")
        
        // aku buat kondisi buton harus disable saat username atau password belum terisi
        XCTAssertFalse(loginButton.isEnabled,"tombol harusnya tidak bisa di clik saat textfield kosong")
    }
    
    func testLoginButtonIsEnableAfterUsernamePasswordHaveValue(){
//        let emailField = app.textFields["Masukan email Anda"]
//        let passwordField = app.secureTextFields["Masukkan Password Anda"]
//        let loginButton = app.buttons["Masuk"]
        
        let emailField = app.textFields["emailField"]
        let passwordField = app.textFields["passwordField"]
        
        XCTAssertTrue(passwordField.exists)
        let loginButton = app.buttons["loginButton"]
        
        emailField.tap()
        emailField.typeText("testUi@example.com")
        
        passwordField.tap()
        passwordField.typeText("password123")
        
        XCTAssertTrue(loginButton.isEnabled, "Tombol harus aktif setelah field terisi")
    }
}
