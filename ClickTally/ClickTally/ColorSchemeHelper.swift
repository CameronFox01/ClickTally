//
//  ColorSchemeHelper.swift
//  ClickTally
//
//  Created by Cameron Fox on 2/21/25.
//
import SwiftUI
import UIKit

// Global function that can be accessed across files
public func preferredColorScheme(darkMode: Bool) -> ColorScheme {
    darkMode ? .dark : .light
}
