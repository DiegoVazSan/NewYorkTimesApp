//
//  NetworkManagerTests.swift
//  NewYorkTimesAppTests
//
//  Created by Diego Vazquez Sanchez on 09/12/24.
//

import XCTest
import Combine
@testable import NewYorkTimesApp

class NetworkManagerTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable> = []
    
    func testFetchArticlesSuccess() {
        //MARK: - GIVEN
        let mockSession = MockNetworkSession()
        let mockData = """
        {
            "results": [
                {
                  "title": "A Neurologist’s Tips to Protect Your Memory",
                  "author": "By Hope Reese",
                  "publishedDate": "2022-07-06",
                  "description": "A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age.",
                  "updated": "2023-06-22 01:23:55",
                  "media": [
                    {
                      "mediaMetadata": [
                        {
                          "url": "https://static01.nyt.com/images/2022/07/19/well/05Well-BetterMemory/05Well-BetterMemory-thumbStandard.jpg",
                          "format": "Standard Thumbnail",
                          "height": 75,
                          "width": 75
                        },
                        {
                          "url": "https://static01.nyt.com/images/2022/07/19/well/05Well-BetterMemory/05Well-BetterMemory-mediumThreeByTwo210.jpg",
                          "format": "mediumThreeByTwo210",
                          "height": 140,
                          "width": 210
                        },
                        {
                          "url": "https://static01.nyt.com/images/2022/07/19/well/05Well-BetterMemory/05Well-BetterMemory-mediumThreeByTwo440.jpg",
                          "format": "mediumThreeByTwo440",
                          "height": 293,
                          "width": 440
                        }
                      ]
                    }
                  ]
                },
                {
                  "title": "A Neurologist’s Tips to Protect Your Memory",
                  "author": "By Hope Reese",
                  "publishedDate": "2022-07-06",
                  "description": "A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age.",
                  "updated": "2023-06-22 01:23:55",
                  "media": [
                    {
                      "mediaMetadata": [
                        {
                          "url": "https://static01.nyt.com/images/2022/07/19/well/05Well-BetterMemory/05Well-BetterMemory-thumbStandard.jpg",
                          "format": "Standard Thumbnail",
                          "height": 75,
                          "width": 75
                        },
                        {
                          "url": "https://static01.nyt.com/images/2022/07/19/well/05Well-BetterMemory/05Well-BetterMemory-mediumThreeByTwo210.jpg",
                          "format": "mediumThreeByTwo210",
                          "height": 140,
                          "width": 210
                        },
                        {
                          "url": "https://static01.nyt.com/images/2022/07/19/well/05Well-BetterMemory/05Well-BetterMemory-mediumThreeByTwo440.jpg",
                          "format": "mediumThreeByTwo440",
                          "height": 293,
                          "width": 440
                        }
                      ]
                    }
                  ]
                }
                }
            ]
        }
        """.data(using: .utf8)
        mockSession.mockData = mockData
        
        let networkManager = NetworkManager(session: mockSession)
        
        //MARK: - WHEN
        let expectation = self.expectation(description: "Fetching Articles")
        
        networkManager.fetchArticles()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Expected success, but got error: \(error)")
                }
            }, receiveValue: { articles in
                //MARK: - THEN
                XCTAssertEqual(articles.count, 2)
                XCTAssertEqual(articles[0].title, "Article 1")
                XCTAssertEqual(articles[1].title, "Article 2")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testFetchArticlesFailure() {
        //MARK: - GIVEN
        let mockSession = MockNetworkSession()
        let mockError = URLError(.notConnectedToInternet)
        mockSession.mockError = mockError
        let networkManager = NetworkManager(session: mockSession)
        
        //MARK: - WHEN
        let expectation = self.expectation(description: "Fetching Articles")
        
        networkManager.fetchArticles()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("Expected failure, but got success")
                case .failure(let error):
                    //MARK: - THEN
                    XCTAssertEqual(error as? URLError, mockError)
                    expectation.fulfill()
                }
            }, receiveValue: { articles in
                XCTFail("Expected failure, but got articles: \(articles)")
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

