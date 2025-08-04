# wgpu-intro

[![Deploy to GitHub Pages](https://github.com/bowber/wgpu-intro/actions/workflows/deploy.yml/badge.svg)](https://github.com/bowber/wgpu-intro/actions/workflows/deploy.yml)

A WebGPU introduction project built with Rust and wasm-pack.

🚀 **[Live Demo](https://bowber.github.io/wgpu-intro/)**

## Browser Compatibility

This project implements a robust fallback mechanism for maximum browser compatibility:

1. **WebGPU** (preferred): For modern browsers with WebGPU support
2. **WebGL fallback**: Automatic fallback when WebGPU is unavailable
3. **Progressive degradation**: Multiple fallback attempts for different environments

### Supported Browsers
- **WebGPU**: Chrome 113+, Firefox with experimental flags, Safari 18+
- **WebGL**: All modern browsers (Chrome, Firefox, Safari, Edge)

If you encounter adapter creation issues, check that:
- Your browser supports WebGL (visit [webglreport.com](https://webglreport.com))
- Hardware acceleration is enabled in browser settings
- For WebGPU: Enable experimental features in browser flags

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

