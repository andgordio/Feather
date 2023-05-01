# Feather

### Warning

Feather is an experimental package in the early stages of development.

### Use

Apply styles directly using `.style` view modifier:

```
Text("I’m blue")
    .style(.pv, .ph20, .bgBlue, .roundedM)
```

Or extract into a variable that stores a `StyleParam` array:

```
let blueButton: [StyleParam] = [.pv, .ph20, .bgBlue, .roundedM]

Text("I’m blue")
    .style(blueButton)
```

### Available styles

See `StyleParam` enum in `Sources/Style.swift`
