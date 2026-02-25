@[Link(ldflags: "-framework Cocoa -framework WebKit -framework Foundation #{__DIR__}/../ext/cocoadock.m")]
lib Native
  fun cocoadock_is_app_to_dock(LibC::Char*) : Bool
  fun cocoadock_add_app_to_dock(LibC::Char*) : Void
  fun cocoadock_remove_app_from_dock(LibC::Char*) : Void
end

module CocoaDock
  class CocoaDock
    def app_in_dock?(path : String) : Bool
      Native.cocoadock_is_app_to_dock(path)
    end

    def add_app(path : String)
      Native.cocoadock_add_app_to_dock(path)
    end

    def remove_app(path : String)
      Native.cocoadock_remove_app_from_dock(path)
    end
  end
end
