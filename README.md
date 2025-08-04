# wgpu-intro

[![Deploy to GitHub Pages](https://github.com/bowber/wgpu-intro/actions/workflows/deploy.yml/badge.svg)](https://github.com/bowber/wgpu-intro/actions/workflows/deploy.yml)

A WebGPU introduction project built with Rust and wasm-pack.

🚀 **[Live Demo](https://bowber.github.io/wgpu-intro/)**

## Browser Compatibility

This project implements a robust fallback mechanism for maximum browser compatibility:

1. **WebGPU** (preferred): For modern browsers with WebGPU support
2. **WebGL fallback**: Automatic fallback when WebGPU is unavailable  
3. **Progressive degradation**: 4-level fallback system for different environments
4. **Enhanced error handling**: User-friendly messages with troubleshooting suggestions

### Supported Browsers
- **WebGPU**: Chrome 113+, Firefox with experimental flags, Safari 18+
- **WebGL**: All modern browsers (Chrome, Firefox, Safari, Edge)

### Fallback Strategy
The application automatically tries adapters in this order:
1. WebGPU with surface compatibility (high performance)
2. WebGL with surface compatibility (high performance)  
3. WebGL without surface requirement (high performance)
4. WebGL with low power preference (final fallback)

If you encounter adapter creation issues, check that:
- Your browser supports WebGL (visit [webglreport.com](https://webglreport.com))
- Hardware acceleration is enabled in browser settings
- For WebGPU: Enable experimental features in browser flags

The console will show detailed progress with visual indicators (✅⚠️❌) to help diagnose any compatibility issues.

## Run desktop
```bash
cargo run
```

## Build wasm
```bash
wasm-pack build --target web // Make sure you have wasm-pack installed: cargo install wasm-pack
```

## Run web
```bash
serve . // Make sure you have serve installed: npm install -g serve
```

## Testing

This project includes comprehensive browser compatibility tests. See [TESTING.md](TESTING.md) for detailed instructions on running local browser tests.

### Quick Test Commands
```bash
# Run unit tests
cargo test

# Build and test WASM
wasm-pack build --target web --release
cargo test -- --nocapture
```

For browser compatibility testing with Selenium, see the testing guide.

