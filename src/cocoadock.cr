@[Link(ldflags: "-framework Cocoa -framework WebKit -framework Foundation #{__DIR__}/../ext/cocoadock.m")]
lib Native
  fun cocoadock_is_app_to_dock(LibC::Char*) : Bool
  fun cocoadock_add_app_to_dock(LibC::Char*) : Void
  fun cocoadock_remove_app_from_dock(LibC::Char*) : Void
  fun cocoadock_remove_others_in_dock : Void
  fun cocoadock_remove_all_apps_in_dock : Void
  fun cocoadock_get_apps_from_dock : LibC::Char*
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

    def remove_others
      Native.cocoadock_remove_others_in_dock()
    end

    def remove_all
      Native.cocoadock_remove_all_apps_in_dock
    end

    def get_apps
      ptr = Native.get_apps_from_dock
      return [] if ptr.null? || ptr.value == 0

      result = String.new(ptr)
      # Important: if you use strdup in C, you should ideally free the memory
      LibC.free(ptr)

      result.split('\n').reject(&.empty?)
    end
  end
end
