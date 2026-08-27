# swift-ascii-carrier

Narrow integration between the ASCII and Carrier domains.

The `ASCII Carrier` product makes `ASCII.Code` a byte `Carrier.Protocol` and
projects the ASCII atom's named constants into every carrier whose underlying
value is `UInt8`:

```swift
import ASCII_Carrier

struct Byte: Carrier.Protocol {
    let underlying: UInt8

    init(_ underlying: consuming UInt8) {
        self.underlying = underlying
    }
}

let newline: Byte = Byte.ascii.newline
```

`swift-ascii` remains the owner of the constants and their byte values. This
package only supplies the cross-domain conformance and projection.
