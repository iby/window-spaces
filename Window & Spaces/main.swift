import AppKit
import Foundation
import CoreGraphics

internal class Window: NSWindow
{
    override var canBecomeKey: Bool { return false }
    override var canBecomeMain: Bool { return false }
    override var isKeyWindow: Bool { return false }
    override var isMainWindow: Bool { return false }
    override var isMovableByWindowBackground: Bool {
        get { return false }
        set {}
    }
    override var displaysWhenScreenProfileChanges: Bool {
        get { return true }
        set {}
    }
}

class Delegate: NSObject, NSApplicationDelegate {
    var window: Window?

    func applicationDidFinishLaunching(_ notification: Notification) {
        let frame: NSRect = NSRect(x: 0, y: 0, width: 200, height: 100)
        let style: NSWindowStyleMask = [.borderless, .closable]
        let window: Window = Window(contentRect: frame, styleMask: style, backing: .nonretained, defer: true)

        window.allowsToolTipsWhenApplicationIsInactive = true
        window.isOpaque = false
        window.hasShadow = false
        window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.mainMenuWindow))
        window.collectionBehavior = [.canJoinAllSpaces, .transient]

        print(window.styleMask.rawValue)
        print(window.backingType.rawValue)
        print(window.collectionBehavior.rawValue)

        window.makeKeyAndOrderFront(self)
        window.center()

        self.window = window
    }
}

let application: NSApplication = NSApplication()
let delegate: Delegate = Delegate()

application.delegate = delegate
application.run()
