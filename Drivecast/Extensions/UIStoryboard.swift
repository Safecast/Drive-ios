// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType where S.RawValue == String>(segue: S, sender: AnyObject? = nil) {
    performSegueWithIdentifier(segue.rawValue, sender: sender)
  }
}

// swiftlint:disable file_length
// swiftlint:disable type_body_length

struct StoryboardScene {
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    static func initialViewController() -> UINavigationController {
      guard let vc = storyboard().instantiateInitialViewController() as? UINavigationController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case AboutScene = "About"
    static func instantiateAbout() -> UINavigationController {
      guard let vc = StoryboardScene.Main.AboutScene.viewController() as? UINavigationController
      else {
        fatalError("ViewController 'About' is not of the expected class UINavigationController.")
      }
      return vc
    }

    case MenuScene = "Menu"
    static func instantiateMenu() -> UITabBarController {
      guard let vc = StoryboardScene.Main.MenuScene.viewController() as? UITabBarController
      else {
        fatalError("ViewController 'Menu' is not of the expected class UITabBarController.")
      }
      return vc
    }

    case RecordScene = "Record"
    static func instantiateRecord() -> UINavigationController {
      guard let vc = StoryboardScene.Main.RecordScene.viewController() as? UINavigationController
      else {
        fatalError("ViewController 'Record' is not of the expected class UINavigationController.")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
  enum Main: String, StoryboardSegueType {
    case OpenConsole = "OpenConsole"
  }
}

