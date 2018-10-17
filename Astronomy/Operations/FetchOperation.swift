//
//  FetchOperation.swift
//  Astronomy
//
//  Created by Iyin Raphael on 10/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
class FetchOperation: ConcurrentOperation {
    
    init(marsPhotoReference: MarsPhotoReference) {
        self.marsPhotoReference = marsPhotoReference
    }
    
    override func start() {
        state = .isExecuting
    }
    
    override func main() {
        let url = marsPhotoReference.imageURL.usingHTTPS!
        dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                NSLog("Error loading image: \(error)")
                return
            }
            
            if let data = data {
                self.imageData = data
            }
            defer {
                self.state = .isFinished
            }
        }
    }
    
    override func cancel() {
        guard let dataTask = dataTask else {return}
        dataTask.cancel()
    }
    
    
    var dataTask: URLSessionDataTask?
    var imageData: Data?
    var marsPhotoReference: MarsPhotoReference
    
}
