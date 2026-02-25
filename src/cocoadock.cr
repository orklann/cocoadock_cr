@[Link(ldflags: "-framework Cocoa -framework WebKit -framework Foundation #{__DIR__}/../ext/cocoadock.m")]
lib Native
  fun add(a : Int32, b : Int32) : Int32
end

module CocoaDock
  class CocoaDock
    def add(a, b)
      Native.add(a, b)
    end
  end
end
