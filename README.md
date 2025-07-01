# API Service

A lightweight and efficient Dart/Flutter package for handling API requests with optional response caching. Ideal for apps that need consistent, streamlined API access with performance optimization via local cache storage.

## ✨ Features

- Simple API request handling using Dio  
- Built-in request caching support  
- Automatic duplicate request cancellation  
- Support for GET, POST, PUT, DELETE, and other HTTP methods  
- Easily pluggable into any Flutter project  
- Customizable cache expiry  
- Support for multiple API clients (different base URLs per service)
- Third-party API request support with isolated base logic

## 🚀 Getting started

### Prerequisites

- Flutter 3.10+  
- Add `api_request_handler` to your `pubspec.yaml`:

```yaml
dependencies:
  api_request_handler:
    path: ../path_to/api_request_handler
```

### Initialization

```dart
ApiService.initialize(
  baseUrl: 'https://api.example.com',
  enableLogging: true,
  cacheEnabled: true,
);
```

```dart
// For multiple clients
await ApiService.initializeMultipleClients(
  baseUrls: {
    'consumer': 'https://consumer.example.com',
    'cas': 'https://cas.example.com',
  },
  globalHeaders: {
    'Authorization': 'Bearer token',
  },
  interceptors: [TokenInterceptor()],
);
```

## 📦 Usage

```dart
// Using a named client
final response = await ApiRequest.request(
  endpoint: '/users',
  method: 'GET',
  clientName: 'consumer',
);

// Using a third-party base URL
final thirdPartyResponse = await ApiRequest.request(
  endpoint: '/third-party-endpoint',
  method: 'POST',
  data: {'key': 'value'},
  isThirdParty: true,
  thirdPartyBaseUrl: 'https://thirdparty.com',
);
```

## 📁 Example

See the `/example` directory for a working Flutter integration demo.

## 📚 Additional information

- This package uses `Hive` for caching (can be extended to other solutions).
- Issues and contributions are welcome.
- For suggestions or help, reach out to the package maintainer.
- Now supports multiple clients and third-party base URLs.