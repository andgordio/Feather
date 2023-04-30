# Feather

### Warning

Feather is an experimental package in the early stages of development.

### Use

Apply styles directly using `.style` view modifier:

```
Text("I’m blue")
    .style(.pv(10), .ph(40), .bg(.blue), .rounded())
```

Or extract into a variable that stores a `StyleParam` array:

```
let blueButton: [StyleParam] = [.pv(10), .ph(40), .bg(.blue), .rounded()]

Text("I’m blue")
    .style(blueButton)
```

### Available styles

See `StyleParam` enum in `Sources/Style.swift`
