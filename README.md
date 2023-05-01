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

### Animations

Style parameters with explicit values will animate:
```
.style(.bg(disabled ? .gray : .accentColor)) // animates background color transition when the value of `disabled` is changed with animation 
```

Style parameters with built-in values won’t animate:
```
.style(disabled ? .bgGray : .bgAccent) // DOES NOT animate background color transition when the value of `disabled` is changed with animation
```
