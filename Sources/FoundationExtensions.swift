//
//  FoundationExtensions.swift
//  EpicFoundation
//
//  Created by Richard Venable on 10/15/16.
//  Copyright (c) 2016 Epicfox. All rights reserved.
//

import Foundation

// MARK: - Collection

public extension Collection {

    /**
     Returns self if isEmpty is false, otherwise returns nil.
     */
    var nonEmpty: Self? { return isEmpty ? nil : self }

}

public extension Sequence where Iterator.Element: Collection {

    /**
     Returns only the elements which are non-empty.
     */
    func nonEmptyElements() -> [Self.Iterator.Element] { return flatMap { $0.nonEmpty } }

}

// MARK: - ArraySlice

public extension ArraySlice {

    /**
     Returns the first X number of elements
     */
    func first(_ newCount: Int) -> ArraySlice<Element> {
        let endIndex: Int = Swift.min(count, newCount)
        return self[0..<endIndex]
    }

    /**
     Returns the last X number of elements
     */
    func last(_ newCount: Int) -> ArraySlice<Element> {
        let startIndex: Int = Swift.max(0, count - newCount)
        return self[startIndex..<count]
    }
    
}

// MARK: - Array

public extension Array {

    /**
     Returns the element at the index, only if it exists.
     */
    func optionally(at index: Int) -> Element? {
        guard case 0..<count = index else { return nil }
        return self[index]
    }

    /**
     Returns the first X number of elements
     */
    func first(_ newCount: Int) -> ArraySlice<Element> {
        let endIndex: Int = Swift.min(count, newCount)
        return self[0..<endIndex]
    }

    /**
     Returns the last X number of elements
     */
    func last(_ newCount: Int) -> ArraySlice<Element> {
        let startIndex: Int = Swift.max(0, count - newCount)
        return self[startIndex..<count]
    }

}

// MARK: - String

public extension String {

    /**
     Returns a string with the prefix removed.
     */
    func removing(prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return substring(from: index(after: prefix.endIndex))
    }

    /**
     Returns self if isEmpty is false, otherwise returns nil.
     */
    var nonEmpty: String? { return isEmpty ? nil : self }

}

public extension Sequence where Iterator.Element == String {

    /**
     Returns only the elements which are non-empty.
     */
    func nonEmptyElements() -> [String] { return flatMap { $0.nonEmpty } }

}
