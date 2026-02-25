@[Link(ldflags: "-framework Cocoa -framework WebKit -framework Foundation #{__DIR__}/../ext/cocoadock.m")]
lib Native
  fun cocoadock_is_app_to_dock(LibC::Char*) : Bool
end

module CocoaDock
  class CocoaDock
    def app_in_dock?(path : String) : Bool
      Native.cocoadock_is_app_to_dock(path)
    end
  end
end
