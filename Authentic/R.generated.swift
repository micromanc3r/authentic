//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 0 images.
  struct image {
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 3 localization keys.
    struct localizable {
      /// Value: No location
      static let m2_title_empty = Rswift.StringResource(key: "m2_title_empty", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Unknown
      static let m2_title_noname = Rswift.StringResource(key: "m2_title_noname", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Weather app
      static let m1_title = Rswift.StringResource(key: "m1_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      
      /// Value: No location
      static func m2_title_empty(_: Void = ()) -> String {
        return NSLocalizedString("m2_title_empty", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Unknown
      static func m2_title_noname(_: Void = ()) -> String {
        return NSLocalizedString("m2_title_noname", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Weather app
      static func m1_title(_: Void = ()) -> String {
        return NSLocalizedString("m1_title", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Main"
      let weather_detail = StoryboardViewControllerResource<WeatherDetailViewController>(identifier: "weather_detail")
      
      func weather_detail(_: Void = ()) -> WeatherDetailViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: weather_detail)
      }
      
      static func validate() throws {
        if _R.storyboard.main().weather_detail() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'weather_detail' could not be loaded from storyboard 'Main' as 'WeatherDetailViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
