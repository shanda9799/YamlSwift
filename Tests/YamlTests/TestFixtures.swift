//
//  TestFixtures.swift
//  Yaml
//
//  Created by Seivan Heidari on 18/03/16.
//

import Yaml
import XCTest

class FixtureTest: XCTestCase {
    func testCrashingYaml () {
      
        let path = Bundle(for: type(of: self))
            .path(forResource: "Fixtures", ofType: "yml")!
        
        let fileContent = try! String(contentsOfFile: path)
        XCTAssertNoThrow(try Yaml.load(fileContent))

        do {
            let x = try Yaml.load(fileContent)
            print(x)
        }
        catch  {
            print(error)
            
        }
        
        
    }
}

