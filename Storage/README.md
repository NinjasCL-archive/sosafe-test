# Storage

This is a simple storage engine for key, value pairs.

### Sample Usage

```swift

let identifier = "test"
Storage.engine.save(key: identifier, content: identifier)
let saved = Storage.engine.get(key: identifier)
Storage.engine.delete(key: identifier)
```
