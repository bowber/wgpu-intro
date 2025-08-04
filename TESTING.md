# Testing Guide

This project includes comprehensive tests for WebGL/WebGPU compatibility across different browsers.

## Quick Start

### Unit Tests
```bash
# Run all unit tests
cargo test

# Run specific test suites
cargo test webgl_compatibility
cargo test browser_compatibility
```

### Browser Compatibility Tests (Local Development)

#### Prerequisites
1. **Install WebDriver tools:**
   ```bash
   # Firefox
   cargo install geckodriver
   # Or download from: https://github.com/mozilla/geckodriver/releases
   
   # Chrome
   cargo install chromedriver
   # Or download from: https://chromedriver.chromium.org/
   ```

2. **Install serve (for local web server):**
   ```bash
   npm install -g serve
   ```

3. **Build WASM:**
   ```bash
   wasm-pack build --target web --release
   ```

#### Running Browser Tests
1. **Start WebDriver services:**
   ```bash
   # Terminal 1: Start geckodriver for Firefox
   geckodriver --port=4444
   
   # Terminal 2: Start chromedriver for Chrome  
   chromedriver --port=9515
   
   # Terminal 3: Start local web server
   serve . -p 3000
   ```

2. **Run browser tests:**
   ```bash
   # Terminal 4: Run browser compatibility tests
   cargo test browser_compatibility -- --nocapture --test-threads=1
   ```

#### Test Output
- Tests will take screenshots saved as `test_screenshot_*.png`
- Console logs show adapter selection progress with visual indicators (✅⚠️❌)
- Tests are designed to not fail if browsers/drivers aren't available (development-friendly)

## Test Strategy

### Adapter Fallback Testing
The tests verify our 4-level progressive fallback mechanism:

1. **WebGPU + Surface + HighPerformance** (preferred)
2. **WebGL + Surface + HighPerformance** (fallback)
3. **WebGL + NoSurface + HighPerformance** (compatibility)
4. **WebGL + NoSurface + LowPower** (final fallback)

### Browser Support Matrix
- **Chrome/Chromium**: Full WebGPU and WebGL support
- **Firefox**: WebGL support, WebGPU with experimental flags
- **Safari**: WebGL support, WebGPU in Safari 18+
- **Edge**: Similar to Chrome

### Troubleshooting Tests

If browser tests fail:
1. Check that WebDriver services are running on correct ports
2. Verify `serve` is running on port 3000
3. Ensure WASM build exists in `pkg/` directory
4. Check browser console logs in screenshots for specific errors

For CI/CD environments, the tests automatically handle service setup and cleanup.