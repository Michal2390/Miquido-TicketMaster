//
//  Miquido_TicketMasterTests.swift
//  Miquido-TicketMasterTests
//
//  Created by Michal Fereniec on 03/11/2024.
//

import XCTest
import Mocker

@testable import Miquido_TicketMaster

final class Miquido_TicketMasterTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    func testUserFetchingURLSession() {
//        let configuration = URLSessionConfiguration.default
//        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
//        let sessionManager = URLSession(configuration: configuration)
//
//        let apiEndpoint = URL(string: "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=PL&apikey=TAGEemR66fnjzOSKeGibI0Q6SMT6c9G1#")!
//        let expectedUser = EventResponse(embedded: EmbeddedEvents(events: []))
//        let requestExpectation = expectation(description: "Request should finish")
//
//        let mockedData = try! JSONEncoder().encode(expectedUser)
//        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
//        mock.register()
//
//        sessionManager.dataTask(with: apiEndpoint) { (data, response, error) in
//            defer { requestExpectation.fulfill() } //do this at the end of closure
//            do {
//                if let error = error {
//                    throw error
//                }
//
//                let user = try JSONDecoder().decode(EventResponse.self, from: data!)
//                XCTAssertEqual(user, expectedUser)
//            } catch {
//                XCTFail(error.localizedDescription)
//            }
//        }.resume()
//
//        wait(for: [requestExpectation], timeout: 10.0)
//    }
    
    func testDeletingContent() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let sessionManager = URLSession(configuration: configuration)
        /// Setup the deleter with our URLSession that's containing the URLProtocol.
        //let deleter = ContentDeleter(sessionManager: sessionManager)

        // Setup the API endpoint
        let contentIdentifier = UUID().uuidString
        let apiEndpoint = URL(string: "https://app.ticketmaster.com/discovery/v2/events/\(contentIdentifier).json?apikey=TAGEemR66fnjzOSKeGibI0Q6SMT6c9G1")!

        // Register the mock
        let mockExpectation = expectation(description: "The content deletion mock should be called")
        var mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 204, data: [.delete: Data()])
        mock.completion = {
            mockExpectation.fulfill()
        }
        mock.register()

        let contentDeletionExpectation = expectation(description: "Completion should be called after deletion")
        //deleter.deleteContent(identifier: contentIdentifier) {
            contentDeletionExpectation.fulfill()
        }
        /// Verify both expectations are met in the right order.
       // wait(for: [mockExpectation, contentDeletionExpectation], timeout: 10.0, enforceOrder: true)
    }
    
    struct LicenseValidator {
        enum Error: Swift.Error {
            case emptyLicenseKey
        }

        func validate(licenseKey: String) throws {
            guard !licenseKey.isEmpty else {
                throw Error.emptyLicenseKey
            }
        }
    }

    class LicenseValidatorTests: XCTestCase {
        let validator = LicenseValidator()
        func testThrowingEmptyLicenseKeyError() {
            XCTAssertThrowsError(try validator.validate(licenseKey: ""), "An empty license key error should be thrown") { error in
                XCTAssertEqual(error as? LicenseValidator.Error, .emptyLicenseKey)
            }
        }

        func testNotThrowingLicenseErrorForNonEmptyKey() {
            XCTAssertNoThrow(try validator.validate(licenseKey: "1234-1234-2134-2137"), "Non-empty license key should pass")
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
