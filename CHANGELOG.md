## 0.0.1-beta.2

### ✨ New Features
* Added support for configuring existing API keys with `inquiryMerchantByKey`.
* Introduced `ABAInquiryMerchantByKeyRequestModel` for API key inquiry requests.

### 🛠️ Refactoring & Improvements
* Renamed `getMerchantByRegisterRef` to `inquiryMerchantByRef`.
* Renamed `ABAGetMerchantResponseModel` to `ABAInquiryMerchantResponseModel` and updated associated models.
* Removed unused `merchantId` parameter from `ABAPayway` and `ApiService` initializers.
* Updated `opensslEncrypt` helper function to accept a `String` instead of `Map<String, dynamic>`.
* Updated `generateHash` to accept `publicKey` instead of `partnerId` for HMAC key generation.

### 🐛 Bug Fixes
* Fixed openssl encryption logic to JSON-encode requests properly before encryption.

### 📝 Documentation & Examples
* Updated `README.md` with new `inquiryMerchantByRef` and `inquiryMerchantByKey` integration steps.
* Updated the example app (`example/lib/main.dart`) to demonstrate registration status and API key credential inquiry.

## 0.0.1-beta.1

### ✨ New Features
* Initial release for partner integration
