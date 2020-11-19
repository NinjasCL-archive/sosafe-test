# Shared

These are common utilities and dependencies used across the app.

## Logger

Provides logging with the https://github.com/apple/swift-log package.

Example:

```swift

Shared.log.info("Hello")
```

## Environment

Detects which environment the app is currently running.

Example:

```swift

Shared.env.isDebug()
```
