# 🎬 Universal Video Converter Pro v6.0 - Enhanced Edition

<div align="center">

![Version](https://img.shields.io/badge/version-6.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey.svg)
![FFmpeg](https://img.shields.io/badge/FFmpeg-required-red.svg)

**Professional batch video converter with hardware acceleration, audio fix, and 29+ powerful tools**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Changelog](#-changelog) • [Issues](#-known-issues--solutions)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Usage](#-usage)
- [Conversion Modes](#-conversion-modes)
- [Advanced Tools](#-advanced-tools)
- [Utilities](#-utilities)
- [Hardware Acceleration](#-hardware-acceleration)
- [Audio Fix](#-audio-fix-solution)
- [Changelog](#-changelog)
- [Known Issues & Solutions](#-known-issues--solutions)
- [Contributing](#-contributing)
- [License](#-license)
- [Author](#-author)

---

## 🌟 Overview

Universal Video Converter Pro is a powerful Windows batch script that leverages FFmpeg to provide professional-grade video conversion capabilities. It features automatic hardware detection, audio error fixes, multi-threading optimization, and an intuitive menu-driven interface.

### Why Use This Tool?

- ✅ **One-Click Conversion** - No complex FFmpeg commands needed
- ✅ **Hardware Acceleration** - Auto-detects NVIDIA, AMD, Intel GPUs
- ✅ **Audio Fix Built-in** - Solves AAC encoding errors automatically
- ✅ **Batch Processing** - Convert hundreds of files with one command
- ✅ **29+ Tools** - Everything from extraction to DVD ripping
- ✅ **Progress Tracking** - Real-time statistics and success rates
- ✅ **Multi-format Support** - MP4, MKV, AVI, MOV, WebM, TS, FLV, M4V

---

## 🚀 Features

### 🎯 Main Conversion Modes

| Mode | CRF | Preset | Best For | Audio | Speed |
|------|-----|--------|----------|-------|-------|
| **Ultra Fast** | 20 | fast | Quick conversions with HW acceleration | 192k AAC | ⚡⚡⚡⚡⚡ |
| **Ultra Quality** | 16 | veryslow | Archival, professional work | 320k AAC | ⚡ |
| **Lightning Remux** | - | - | Format change without re-encoding | Copy | ⚡⚡⚡⚡⚡ |
| **High Quality** | 18 | slow | General purpose, excellent quality | 256k AAC | ⚡⚡⚡ |
| **Smart Compress** | 26 | slow | Space-saving, streaming | 128k AAC | ⚡⚡⚡ |
| **Balanced Pro** | 21 | medium | Daily use, good balance | 192k AAC | ⚡⚡⚡⚡ |
| **Custom Advanced** | Custom | Custom | Full control over parameters | Custom | Custom |

### ✨ Advanced Tools (21 Tools)

1. **🎵 Audio Extract** - Extract audio in MP3, AAC, FLAC, WAV, OPUS, M4A formats
2. **📐 Batch Resize** - Resize to 4K, 1440p, 1080p, 720p, 480p, or custom resolution
3. **📝 Subtitle Tools** - Extract, burn, or add SRT subtitles
4. **🔗 Smart Merge** - Concatenate multiple videos into one
5. **✂️ Precision Trim** - Cut videos by time with frame accuracy
6. **🎞️ Framerate Converter** - Change FPS (24, 30, 60, custom)
7. **🔊 Audio Fix + Normalize** - Fix AAC errors and normalize volume
8. **🌑 Deinterlace Pro** - Remove interlacing artifacts
9. **🎥 Rotate/Flip** - 90°, 180°, 270° rotation, horizontal/vertical flip
10. **⚡ Speed Control** - Speed up or slow down videos
11. **🖼️ Frame Extractor** - Extract frames as PNG images
12. **📺 TV Ultimate** - Maximum TV/console compatibility with size optimization
13. **🎬 DVD/Blu-ray Ripper** - Rip optical media to MP4
14. **🎯 Batch Queue System** - Queue multiple conversion tasks

### 🛠️ Utility Tools

- **📊 Media Analyzer Pro** - Detailed codec, resolution, bitrate information
- **📈 Size Comparison Chart** - Compare file sizes before/after conversion
- **🧹 Smart Cleanup** - Manage output folders efficiently
- **🔍 Find Corrupted Files** - Scan and identify damaged video files
- **⚙️ System Settings** - View hardware capabilities
- **🐛 Debug Mode** - Verbose error logging for troubleshooting

---

## 💻 Requirements

### Essential
- **Windows** 7/8/10/11 (64-bit recommended)
- **FFmpeg** (must be in PATH or same directory)
- **Command Prompt** with Administrator privileges (recommended)

### Optional (for Hardware Acceleration)
- **NVIDIA GPU** + Latest drivers (for NVENC)
- **AMD GPU** + Latest drivers (for AMF)
- **Intel CPU** with integrated graphics (for QuickSync)

---

## 📥 Installation

### Step 1: Download FFmpeg

1. Visit [FFmpeg Official Website](https://ffmpeg.org/download.html)
2. Download the latest Windows build (Static)
3. Extract to `C:\ffmpeg`

### Step 2: Add FFmpeg to PATH

**Option A: Automatic (Recommended)**
```batch
setx PATH "%PATH%;C:\ffmpeg\bin"
```

**Option B: Manual**
1. Right-click "This PC" → Properties
2. Advanced System Settings → Environment Variables
3. Edit "Path" → Add `C:\ffmpeg\bin`
4. Click OK and restart Command Prompt

### Step 3: Download Converter

```bash
git clone https://github.com/Abdelrahman968/mkv-to-mp4-batch.git
cd mkv-to-mp4-batch
```

Or download ZIP from [Releases](https://github.com/Abdelrahman968/mkv-to-mp4-batch/releases)

### Step 4: Verify Installation

```batch
ffmpeg -version
```

If FFmpeg version appears, you're ready! ✅

---

## 🎮 Usage

### Basic Usage

1. **Place video files** in the same folder as `converter.bat`
2. **Run** `converter.bat` (double-click or via command prompt)
3. **Select** a conversion mode (1-29)
4. **Wait** for processing to complete
5. **Find** converted files in output folders

### Example Workflow

```
📁 My Videos/
├── converter.bat          ← Run this
├── movie1.mkv            ← Input files
├── movie2.avi
├── series_s01e01.mp4
└── Ultra_Quality/        ← Output folder (auto-created)
    ├── movie1.mp4
    ├── movie2.mp4
    └── series_s01e01.mp4
```

### Quick Start Commands

```batch
REM Navigate to video folder
cd C:\My Videos

REM Run converter
converter.bat

REM Select option (e.g., 4 for High Quality)
4

REM Wait for completion
```

---

## 🎯 Conversion Modes

### Mode 1: Ultra Fast (Hardware Accelerated)
- **Best for**: Large batches, quick results
- **Quality**: Good
- **Speed**: Maximum (5-10x realtime with GPU)
- **Uses**: GPU encoder (NVENC/AMF/QSV)

### Mode 2: Ultra Quality
- **Best for**: Archival, master copies
- **Quality**: Excellent (CRF 16)
- **Speed**: Slow (0.5-1x realtime)
- **File Size**: Largest

### Mode 3: Lightning Remux
- **Best for**: Container change without quality loss
- **Quality**: Identical to source
- **Speed**: Instant (10-100x realtime)
- **Note**: Only changes container (MKV→MP4)

### Mode 4: High Quality
- **Best for**: General purpose, daily use
- **Quality**: Excellent (CRF 18)
- **Speed**: Medium (1-2x realtime)
- **Sweet Spot**: Quality vs size vs speed

### Mode 5: Smart Compress
- **Best for**: Sharing, uploading, storage
- **Quality**: Good (CRF 26)
- **Speed**: Medium
- **File Size**: 30-50% of original

### Mode 19: TV Ultimate
- **Best for**: TVs, game consoles, set-top boxes
- **Features**: H.264 Main Profile, Level 4.0, YUV420P
- **Compatibility**: Maximum device compatibility
- **Audio**: Fixed AAC 128k stereo

---

## 🔧 Advanced Tools

### Audio Extract (Mode 9)
Extract audio tracks in various formats:
- **MP3 320k** - Universal compatibility
- **AAC 256k** - Modern devices
- **FLAC** - Lossless archival
- **WAV** - Uncompressed
- **OPUS 192k** - Best quality/size ratio
- **M4A 256k** - Apple devices

### Batch Resize (Mode 10)
Upscale or downscale videos:
- **4K (3840×2160)** - Ultra HD
- **1440p (2560×1440)** - QHD
- **1080p (1920×1080)** - Full HD
- **720p (1280×720)** - HD
- **480p (854×480)** - SD
- **Custom** - Any resolution

### Subtitle Tools (Mode 11)
- **Extract**: Pull SRT subtitles from MKV/MP4
- **Burn**: Hardcode subtitles into video
- **Add**: Embed external SRT files

### Batch Queue (Mode 8)
Process multiple tasks with different settings:
```
Task format: filename.mkv|output_folder|crf|preset
Example: movie.mkv|Custom|20|medium
```

---

## ⚡ Hardware Acceleration

### Auto-Detection
The script automatically detects your GPU:

| GPU Type | Encoder | Decoder | Speed Boost |
|----------|---------|---------|-------------|
| NVIDIA | `h264_nvenc` | CUDA | 5-10x |
| AMD | `h264_amf` | D3D11VA | 4-8x |
| Intel | `h264_qsv` | QuickSync | 3-6x |
| CPU Only | `libx264` | Software | 1x (baseline) |

### Manual Override
Edit script to force specific encoder:
```batch
set hw_encoder=h264_nvenc   REM Force NVIDIA
set hw_encoder=h264_amf     REM Force AMD
set hw_encoder=h264_qsv     REM Force Intel
set hw_encoder=libx264      REM Force CPU
```

---

## 🔊 Audio Fix Solution

### Problem
AAC encoding errors in FFmpeg:
```
[aac @ ...] Number of bands (54) exceeds limit (44)
[dec:aac @ ...] Error submitting packet to decoder: Invalid data found
```

### Solution (Built-in)
Version 6.0 includes automatic audio fixes:
```batch
-strict -2                    # Allow experimental AAC encoder
-max_muxing_queue_size 9999   # Prevent buffer overflow
-ar 48000                     # Force correct sample rate
-ac 2                         # Ensure stereo compatibility
```

### Applied Everywhere
Audio fix is automatically applied to:
- ✅ All conversion modes (1-7)
- ✅ Audio extract (9)
- ✅ Batch resize (10)
- ✅ Subtitle tools (11)
- ✅ TV mode (20)
- ✅ All re-encoding operations

**Result**: Zero AAC errors in v6.0! 🎉

---

## 📜 Changelog

### Version 6.0 (December 2024) - Enhanced Edition
**🔥 Major Release - Audio Fix + Performance**

#### 🐛 Bug Fixes
- ✅ **Fixed AAC encoding errors completely** (`Number of bands exceeds limit`)
- ✅ Fixed audio desync issues during conversion
- ✅ Fixed buffer overflow errors with long videos
- ✅ Fixed TV mode compatibility issues
- ✅ Resolved subtitle burning crashes

#### ⚡ Performance Improvements
- ✅ Multi-threading support (auto-detects CPU cores)
- ✅ Hardware decoding for GPU input processing
- ✅ Optimized preset configurations (30-50% faster)
- ✅ Parallel audio processing
- ✅ Reduced memory usage for 4K videos

#### 🎨 UI/UX Enhancements
- ✅ Modern box-drawing characters
- ✅ Color-coded status messages (✅/❌)
- ✅ Real-time progress tracking
- ✅ Success/failure counters
- ✅ Enhanced visual hierarchy
- ✅ Better menu organization (29 options)

#### 🆕 New Features
- ✅ **Batch Queue System** - Queue multiple conversion tasks
- ✅ **DVD/Blu-ray Ripper** - Rip optical media to MP4
- ✅ **Corrupted File Finder** - Detect damaged files
- ✅ **Debug Mode** - Verbose error logging
- ✅ **Smart Cleanup** - Targeted folder management
- ✅ **M4A Audio Extract** - Additional audio format
- ✅ **4K Resize Support** - Upscale to Ultra HD
- ✅ **Author Info Page** - Dedicated credits section

#### 🔧 Technical Improvements
- ✅ Error logging to `converter_log.txt`
- ✅ Improved error recovery
- ✅ Better file format detection
- ✅ Enhanced hardware detection logic
- ✅ Code optimization and cleanup

---

### Version 5.3 (October 2024)
- ✅ Added Changelog tab
- ✅ Final UI polish and fixes
- ✅ Fixed display alignment issues

### Version 5.2 (September 2024)
- ✅ Author information tab
- ✅ Enhanced settings menu
- ✅ System info display

### Version 5.1 (August 2024)
- ✅ Full feature implementation
- ✅ Emoji-enhanced UI
- ✅ 26 tool modes

### Version 5.0 (July 2024)
- ✅ Major feature expansion
- ✅ TV Ultimate mode
- ✅ Advanced tools suite

### Version 4.0 (June 2024)
- ✅ New advanced tools
- ✅ Frame extraction
- ✅ Speed control

### Version 3.0 (May 2024)
- ✅ Professional release
- ✅ Multiple quality presets
- ✅ Audio extraction

### Version 2.0 (April 2024)
- ✅ Hardware acceleration support
- ✅ GPU detection
- ✅ NVENC/AMF/QSV encoders

### Version 1.0.0 (March 2024)
- ✅ Initial release
- ✅ Basic MKV to MP4 conversion
- ✅ CRF-based quality control

---

## ⚠️ Known Issues & Solutions

### Issue 1: "FFmpeg not recognized"
**Problem**: Command Prompt can't find FFmpeg

**Solution**:
```batch
# Verify FFmpeg location
where ffmpeg

# If not found, add to PATH or copy ffmpeg.exe to script folder
copy C:\ffmpeg\bin\ffmpeg.exe .
```

---

### Issue 2: Audio Errors (SOLVED in v6.0)
**Problem**: `[aac @ ...] Number of bands exceeds limit`

**Solution**: ✅ **Already fixed in v6.0!** Audio fix is automatic.

**Manual override** (if needed):
```batch
ffmpeg -i input.mkv -c:v libx264 -c:a aac -strict -2 -max_muxing_queue_size 9999 output.mp4
```

---

### Issue 3: Slow Conversion Speed
**Problem**: Videos convert slower than realtime

**Solutions**:
1. **Use Mode 1** (Ultra Fast with hardware acceleration)
2. **Update GPU drivers** (NVIDIA/AMD/Intel)
3. **Choose faster preset**: `ultrafast` > `fast` > `medium` > `slow` > `veryslow`
4. **Reduce CRF quality**: Higher CRF = faster (try 23-26)
5. **Close background applications**

---

### Issue 4: Hardware Acceleration Not Working
**Problem**: GPU not detected or not being used

**Solutions**:
```batch
# Check GPU detection
nvidia-smi          # For NVIDIA
dxdiag              # For AMD/Intel

# Update drivers
# NVIDIA: https://www.nvidia.com/drivers
# AMD: https://www.amd.com/support
# Intel: https://www.intel.com/content/www/us/en/download-center/home.html

# Force CPU encoding if GPU issues persist
# Edit script: set hw_encoder=libx264
```

---

### Issue 5: Out of Memory Errors
**Problem**: Conversion fails with memory errors on large 4K files

**Solutions**:
1. **Close other applications**
2. **Use Mode 3** (Lightning Remux) for format change only
3. **Reduce resolution** first with Mode 10
4. **Split large files** with Mode 13 (Trim)
5. **Increase virtual memory** in Windows settings

---

### Issue 6: Subtitles Not Burning Correctly
**Problem**: Subtitle burn fails or shows wrong characters

**Solutions**:
```batch
# For UTF-8 subtitles
ffmpeg -i input.mp4 -vf "subtitles=input.srt:force_style='FontName=Arial'" output.mp4

# For embedded subtitles
ffmpeg -i input.mkv -vf subtitles=input.mkv:si=0 output.mp4

# Extract and fix encoding first
ffmpeg -i input.mkv -map 0:s:0 -c:s srt output.srt
```

---

### Issue 7: Color/Quality Loss After Conversion
**Problem**: Output looks washed out or blocky

**Solutions**:
1. **Use Mode 2 or 4** (Ultra/High Quality)
2. **Lower CRF value**: Try 16-18 for best quality
3. **Add color correction**:
```batch
-vf eq=brightness=0.02:saturation=1.1
```
4. **Preserve color space**:
```batch
-color_primaries bt709 -color_trc bt709 -colorspace bt709
```

---

### Issue 8: Files Won't Play on TV/Console
**Problem**: Converted files don't work on smart TV or game console

**Solution**: ✅ **Use Mode 19 (TV Ultimate)** - specifically designed for maximum compatibility
- Forces H.264 Main Profile Level 4.0
- YUV420P pixel format
- AAC stereo audio 48kHz
- FastStart flag for streaming

---

### Issue 9: Batch Processing Stops Mid-Way
**Problem**: Script stops processing after few files

**Solutions**:
1. **Check corrupted files** with Mode 25
2. **Use Debug Mode** (28) to identify problem files
3. **Process problematic files separately**
4. **Check disk space** (requires 2x input size free)

---

### Issue 10: Permission Denied Errors
**Problem**: "Access denied" or "Cannot write to folder"

**Solutions**:
```batch
# Run as Administrator
Right-click converter.bat → Run as Administrator

# Or disable folder protection
Windows Security → Virus & threat protection → Manage ransomware protection → OFF
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

### How to Contribute

1. **Fork the repository**
```bash
git clone https://github.com/Abdelrahman968/mkv-to-mp4-batch.git
```

2. **Create a feature branch**
```bash
git checkout -b feature/amazing-feature
```

3. **Make your changes**
- Add new conversion modes
- Fix bugs
- Improve documentation
- Add new tools

4. **Test thoroughly**
- Test with multiple file formats
- Verify hardware acceleration
- Check for audio sync issues

5. **Commit your changes**
```bash
git commit -m "Add amazing feature"
```

6. **Push to branch**
```bash
git push origin feature/amazing-feature
```

7. **Open Pull Request**

### Coding Standards
- Use clear variable names
- Add comments for complex logic
- Follow existing code style
- Test on Windows 10/11
- Update README if adding features

### Bug Reports
Please include:
- Windows version
- FFmpeg version (`ffmpeg -version`)
- GPU type (if using hardware acceleration)
- Error message (full text)
- Sample file info (codec, resolution)
- Steps to reproduce

---

## 📄 License

This project is licensed under the **MIT License** - see below for details:

```
MIT License

Copyright (c) 2024 Abdelrahman Ayman

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 👤 Author

<div align="center">

### **Abdelrahman Ayman**

[![GitHub](https://img.shields.io/badge/GitHub-Abdelrahman968-black?style=for-the-badge&logo=github)](https://github.com/Abdelrahman968/)
[![Facebook](https://img.shields.io/badge/Facebook-Abdelrahman.968-blue?style=for-the-badge&logo=facebook)](https://www.facebook.com/Abdelrahman.968)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-abdelrahman968-0077B5?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/abdelrahman968/)

</div>

### Connect With Me

- 🐙 **GitHub**: [@Abdelrahman968](https://github.com/Abdelrahman968/)
- 📘 **Facebook**: [Abdelrahman.968](https://www.facebook.com/Abdelrahman.968)
- 💼 **LinkedIn**: [abdelrahman968](https://www.linkedin.com/in/abdelrahman968/)

### Support the Project

If you find this tool useful:
- ⭐ **Star this repository** on GitHub
- 🐛 **Report bugs** via Issues tab
- 💡 **Suggest features** via Issues or Pull Requests
- 📢 **Share** with others who might need it
- ☕ **Buy me a coffee** (if you want to support development)

---

## 🙏 Acknowledgments

- **FFmpeg Team** - For the amazing multimedia framework
- **NVIDIA/AMD/Intel** - For hardware acceleration APIs
- **Open Source Community** - For continuous support and feedback
- **All Contributors** - Thank you for making this tool better!

---

## 📊 Statistics

![GitHub stars](https://img.shields.io/github/stars/Abdelrahman968/mkv-to-mp4-batch?style=social)
![GitHub forks](https://img.shields.io/github/forks/Abdelrahman968/mkv-to-mp4-batch?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/Abdelrahman968/mkv-to-mp4-batch?style=social)

---

## 📞 Support

Need help? Have questions?

1. **Check the [Known Issues](#-known-issues--solutions)** section
2. **Search [existing issues](https://github.com/Abdelrahman968/mkv-to-mp4-batch/issues)**
3. **Open a [new issue](https://github.com/Abdelrahman968/mkv-to-mp4-batch/issues/new)** if needed
4. **Contact me** via social media links above

---

<div align="center">

### Made with ❤️ by [Abdelrahman Ayman](https://github.com/Abdelrahman968/)

**If this tool helped you, please ⭐ star the repo!**

</div>
