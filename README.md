# DeepLAPI(unofficial)

[DeepL](https://www.deepl.com/) is a translation service similar to Google Translate. 
DeepAPI is a Swift open-source library that implements Swift-based clients to interact with the DeepL API using an Authentication Key. You can get an Authentication Key on their website. As of right now, this library supports only the free version of the API

### Installation
The library requires macOS 10.16+ / iOS 14.0+ / tvOS 14.0+ / watchOS 7.0+

You can add DeepLAPI-Swift by adding it as a Swift Package Manager dependency:
1. From the *File* menu, select *Add packages*
2. Enter "[https://github.com/hoyelam/DeepL-Swift]"
3. Select the package

Using `Package.swift`?

``` swift
dependencies: [
    .package(url: "https://github.com/hoyelam/DeepL-Swift")
]
```

### Example
To translate a text
``` swift
let authToken = "12345QWERTASDFG" // Provided by DeepL
let service = DeepLAPI(authToken: testToken)
let request = TranslationRequest(
    text: "Hello World!",
    sourceLanguage: .english,
    targetLanguage: .dutch
)

do {
    let result = try await sut.translateText(request: request)
    print(result.translations)
} catch let error {
    // Your amazing error handling
}
```

### To be supported
- [ ] DeepL Pro
- [ ] Managing Glossaries
- [ ] Translating Documents
