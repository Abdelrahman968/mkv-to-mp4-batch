@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title 🎬 MKV to MP4 Batch Converter - Professional Edition
color 0B

:menu
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║     🎬 MKV to MP4 Batch Converter - Professional Edition ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    👤 Author: Abdelrahman Ayman
echo    🔗 GitHub: https://github.com/Abdelrahman968
echo    📦 Version: 2.0
echo.
echo    ┌───────────────────────────────────────────────────────────┐
echo    │                    🎯 CONVERSION MODES                    │
echo    └───────────────────────────────────────────────────────────┘
echo.
echo       [1] 🚀 Default Mode - Simple MKV to MP4
echo       [2] 💎 Best Mode - Highest Quality
echo       [3] ⚡ Fast Convert - No Re-encoding
echo       [4] 🎨 Quality Convert - High Quality Re-encode
echo       [5] 📦 Compress Convert - Smaller File Size
echo       [6] ⚖️  Balanced Mode - Quality + Size
echo.
echo    ┌───────────────────────────────────────────────────────────┐
echo    │                    ✨ SPECIAL FEATURES                    │
echo    └───────────────────────────────────────────────────────────┘
echo.
echo       [7] 🎵 Extract Audio Only - MP3/AAC/FLAC
echo       [8] 📐 Batch Resize Videos - 720p/1080p/4K
echo       [9] 📝 Add Subtitles to Video
echo       [10] 🔗 Merge Multiple Videos
echo       [11] 💬 Extract Subtitles from MKV
echo.
echo    ┌───────────────────────────────────────────────────────────┐
echo    │                      🛠️  UTILITIES                        │
echo    └───────────────────────────────────────────────────────────┘
echo.
echo       [12] 📊 Show File Information
echo       [13] 📈 Compare File Sizes
echo       [14] 🧹 Clean Output Folders
echo       [15] ⚙️  Settings
echo       [0] 🚪 Exit
echo.
echo    ═══════════════════════════════════════════════════════════
set /p choice="    💡 Choose option (0-15): "

if "%choice%"=="1" goto default_mode
if "%choice%"=="2" goto best_mode
if "%choice%"=="3" goto fast_convert
if "%choice%"=="4" goto quality_convert
if "%choice%"=="5" goto compress_convert
if "%choice%"=="6" goto balanced_mode
if "%choice%"=="7" goto audio_extract
if "%choice%"=="8" goto batch_resize
if "%choice%"=="9" goto add_subtitles
if "%choice%"=="10" goto merge_videos
if "%choice%"=="11" goto extract_subtitles
if "%choice%"=="12" goto show_info
if "%choice%"=="13" goto compare_sizes
if "%choice%"=="14" goto clean_folders
if "%choice%"=="15" goto settings
if "%choice%"=="0" goto end
goto menu

:default_mode
cls
color 0A
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║              🚀 Default Mode - Simple Conversion          ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    ℹ️  Fast conversion using stream copy (no re-encoding)
echo    ✨ Original quality preserved
echo    ⚡ Lightning fast processing
echo.

if not exist "MP4" mkdir "MP4"

set /A count=0
for %%f in (*.mkv) do set /A count+=1

if %count%==0 (
    echo    ┌───────────────────────────────────────────────────────┐
    echo    │ ⚠️  No MKV files found in current directory!          │
    echo    └───────────────────────────────────────────────────────┘
    echo.
    pause
    color 0B
    goto menu
)

echo    ┌───────────────────────────────────────────────────────────┐
echo    │ 📁 Found %count% MKV file(s) to convert                        │
echo    └───────────────────────────────────────────────────────────┘
echo.
echo    🎬 Starting conversion...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv) do (
    set /A i+=1
    echo    ───────────────────────────────────────────────────────────
    echo    📄 FILE [!i!/%count%] %%~nf
    echo    ───────────────────────────────────────────────────────────
    
    ffmpeg -i "%%f" -c copy "MP4\%%~nf.mp4" -hide_banner -loglevel error -stats
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: Error converting %%f
        echo    💡 Try re-encoding with another mode
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.mp4
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                  🎉 Conversion Complete!                  ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total Files: %count%
echo    ✅ Successful: %success%
echo    ❌ Failed: %failed%
echo.
echo    📂 Output: MP4 folder
echo    ═══════════════════════════════════════════════════════════
echo.
pause
color 0B
goto menu

:best_mode
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║              💎 Best Mode - Highest Quality               ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    🎯 Provides the best possible quality
echo    🚀 Hardware acceleration enabled
echo    🎵 Audio: AAC 256kbps
echo    📁 Formats: MKV, AVI, FLV, MOV, WMV, WEBM, M4V
echo.

if not exist "MP4_Best" mkdir "MP4_Best"

set /A count=0
for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No video files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% video file(s)
echo.
echo    🎬 Starting BEST MODE conversion...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    🎞️  FILE [!i!/%count%]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    
    ffmpeg -hwaccel auto -i "%%f" -c:v libx264 -profile:v high -preset fast -crf 18 -c:a aac -b:a 256k -movflags +faststart -map 0:v:0 -map 0:a -strict experimental "MP4_Best\%%~nf.mp4" -hide_banner -loglevel error -stats
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: %%f
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.mp4
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                    📋 Operation Summary                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total: %count% ^| ✅ Success: %success% ^| ❌ Failed: %failed%
echo    📂 Output: MP4_Best folder
echo.
echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:fast_convert
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║              ⚡ Fast Convert - No Re-encoding             ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

if not exist "MP4_Fast" mkdir "MP4_Fast"

set /A count=0
for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No video files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% video file(s)
echo.
echo    ⚡ Converting at lightning speed...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    🎞️  FILE [!i!/%count%]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    
    ffmpeg -i "%%f" -c copy -movflags +faststart "MP4_Fast\%%~nf.mp4" -hide_banner -loglevel error -stats
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: %%f
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.mp4
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                    📋 Operation Summary                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total: %count% ^| ✅ Success: %success% ^| ❌ Failed: %failed%
echo    📂 Output: MP4_Fast folder
echo.
echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:quality_convert
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║           🎨 Quality Convert - High Quality Re-encode     ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

if not exist "MP4_Quality" mkdir "MP4_Quality"

set /A count=0
for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No video files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% video file(s)
echo.
echo    🎨 Converting with hardware acceleration...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    🎞️  FILE [!i!/%count%]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    
    ffmpeg -hwaccel auto -i "%%f" -c:v libx264 -preset medium -crf 20 -c:a aac -b:a 192k -movflags +faststart "MP4_Quality\%%~nf.mp4" -hide_banner -loglevel error -stats
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: %%f
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.mp4
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                    📋 Operation Summary                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total: %count% ^| ✅ Success: %success% ^| ❌ Failed: %failed%
echo    📂 Output: MP4_Quality folder
echo.
echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:compress_convert
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║           📦 Compress Convert - Smaller File Size         ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

if not exist "MP4_Compressed" mkdir "MP4_Compressed"

set /A count=0
for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No video files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% video file(s)
echo.
echo    📦 Compressing and converting...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    🎞️  FILE [!i!/%count%]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    
    ffmpeg -hwaccel auto -i "%%f" -c:v libx264 -preset fast -crf 23 -c:a aac -b:a 128k -movflags +faststart "MP4_Compressed\%%~nf.mp4" -hide_banner -loglevel error -stats
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: %%f
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.mp4
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                    📋 Operation Summary                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total: %count% ^| ✅ Success: %success% ^| ❌ Failed: %failed%
echo    📂 Output: MP4_Compressed folder
echo.
echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:balanced_mode
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║       ⚖️  Balanced Mode - Quality + Size Optimization     ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

if not exist "MP4_Balanced" mkdir "MP4_Balanced"

set /A count=0
for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No video files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% video file(s)
echo.
echo    ⚖️  Converting with balanced settings...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv *.avi *.flv *.mov *.wmv *.webm *.m4v) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    🎞️  FILE [!i!/%count%]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    
    ffmpeg -hwaccel auto -i "%%f" -c:v libx264 -preset medium -crf 20 -c:a aac -b:a 160k -movflags +faststart "MP4_Balanced\%%~nf.mp4" -hide_banner -loglevel error -stats
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: %%f
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.mp4
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                    📋 Operation Summary                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total: %count% ^| ✅ Success: %success% ^| ❌ Failed: %failed%
echo    📂 Output: MP4_Balanced folder
echo.
echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:audio_extract
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                🎵 Extract Audio Only                      ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo       [1] 🎵 MP3 (192 kbps)
echo       [2] 🎵 MP3 (320 kbps)
echo       [3] 🎵 AAC (256 kbps)
echo       [4] 🎵 FLAC (Lossless)
echo       [5] 🔙 Back to Main Menu
echo.
echo    ═══════════════════════════════════════════════════════════
set /p audio_choice="    💡 Choose format (1-5): "

if "%audio_choice%"=="1" goto extract_mp3_192
if "%audio_choice%"=="2" goto extract_mp3_320
if "%audio_choice%"=="3" goto extract_aac
if "%audio_choice%"=="4" goto extract_flac
if "%audio_choice%"=="5" goto menu
goto audio_extract

:extract_mp3_192
set audio_format=mp3
set audio_codec=libmp3lame
set audio_bitrate=192k
set output_folder=Audio_MP3_192
goto process_audio

:extract_mp3_320
set audio_format=mp3
set audio_codec=libmp3lame
set audio_bitrate=320k
set output_folder=Audio_MP3_320
goto process_audio

:extract_aac
set audio_format=aac
set audio_codec=aac
set audio_bitrate=256k
set output_folder=Audio_AAC
goto process_audio

:extract_flac
set audio_format=flac
set audio_codec=flac
set audio_bitrate=
set output_folder=Audio_FLAC
goto process_audio

:process_audio
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║            🎵 Extracting Audio - %output_folder%              ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

if not exist "%output_folder%" mkdir "%output_folder%"

set /A count=0
for %%f in (*.mkv) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No MKV files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% MKV file(s)
echo.
echo    🎵 Extracting audio...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    🎼 AUDIO [!i!/%count%]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    
    if "%audio_bitrate%"=="" (
        ffmpeg -i "%%f" -vn -c:a %audio_codec% "%output_folder%\%%~nf.%audio_format%" -hide_banner -loglevel error -stats
    ) else (
        ffmpeg -i "%%f" -vn -c:a %audio_codec% -b:a %audio_bitrate% "%output_folder%\%%~nf.%audio_format%" -hide_banner -loglevel error -stats
    )
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: %%f
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.%audio_format%
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                    📋 Operation Summary                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total: %count% ^| ✅ Success: %success% ^| ❌ Failed: %failed%
echo    📂 Output: %output_folder% folder
echo.
echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:batch_resize
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                  📐 Batch Resize Videos                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo       [1] 📺 720p (1280x720)
echo       [2] 📺 1080p (1920x1080)
echo       [3] 📺 1440p (2560x1440)
echo       [4] 📺 4K (3840x2160)
echo       [5] ✏️  Custom Resolution
echo       [6] 🔙 Back to Main Menu
echo.
echo    ═══════════════════════════════════════════════════════════
set /p resize_choice="    💡 Choose resolution (1-6): "

if "%resize_choice%"=="1" set resolution=1280:720& set folder_name=MP4_720p& goto process_resize
if "%resize_choice%"=="2" set resolution=1920:1080& set folder_name=MP4_1080p& goto process_resize
if "%resize_choice%"=="3" set resolution=2560:1440& set folder_name=MP4_1440p& goto process_resize
if "%resize_choice%"=="4" set resolution=3840:2160& set folder_name=MP4_4K& goto process_resize
if "%resize_choice%"=="5" goto custom_resolution
if "%resize_choice%"=="6" goto menu
goto batch_resize

:custom_resolution
echo.
set /p custom_width="    📏 Enter width (e.g., 1280): "
set /p custom_height="    📏 Enter height (e.g., 720): "
set resolution=%custom_width%:%custom_height%
set folder_name=MP4_Custom_%custom_width%x%custom_height%
goto process_resize

:process_resize
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║            📐 Resizing Videos to %resolution%                 ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

if not exist "%folder_name%" mkdir "%folder_name%"

set /A count=0
for %%f in (*.mkv) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No MKV files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% MKV file(s)
echo.
echo    📐 Resizing videos...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    🎞️  RESIZE [!i!/%count%]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    
    ffmpeg -i "%%f" -vf scale=%resolution% -c:v libx264 -preset medium -crf 20 -c:a aac -b:a 192k -movflags +faststart "%folder_name%\%%~nf.mp4" -hide_banner -loglevel error -stats
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: %%f
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.mp4
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                    📋 Operation Summary                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total: %count% ^| ✅ Success: %success% ^| ❌ Failed: %failed%
echo    📂 Output: %folder_name% folder
echo.
echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:add_subtitles
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                📝 Add Subtitles to Video                  ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

if not exist "MP4_Subtitled" mkdir "MP4_Subtitled"

set /A count=0
for %%f in (*.mkv) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No MKV files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% MKV file(s)
echo.
echo    ℹ️  Embedding ALL subtitle tracks into MP4
echo.
echo    📝 Processing...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    📝 SUBTITLE [!i!/%count%]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    
    ffmpeg -i "%%f" -c:v copy -c:a copy -c:s mov_text -movflags +faststart "MP4_Subtitled\%%~nf.mp4" -hide_banner -loglevel error -stats
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: %%f
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.mp4
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                    📋 Operation Summary                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total: %count% ^| ✅ Success: %success% ^| ❌ Failed: %failed%
echo    📂 Output: MP4_Subtitled folder
echo.
echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:merge_videos
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                 🔗 Merge Multiple Videos                  ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

set /A count=0
for %%f in (*.mkv) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No MKV files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% MKV file(s)
echo.
echo    📝 Creating file list...

if exist filelist.txt del filelist.txt

for %%f in (*.mkv) do (
    echo file '%%f' >> filelist.txt
)

echo.
set /p output_name="    📝 Enter output filename (no extension): "

if "%output_name%"=="" (
    set output_name=merged_output
)

echo.
echo    🔗 Merging videos...
echo.

ffmpeg -f concat -safe 0 -i filelist.txt -c copy "%output_name%.mp4" -hide_banner -loglevel error -stats

if %ERRORLEVEL% neq 0 (
    echo.
    echo    ❌ FAILED: Could not merge videos!
) else (
    echo.
    echo    ✅ SUCCESS: Videos merged!
    echo    📂 Output: %output_name%.mp4
)

del filelist.txt

echo.
pause
goto menu

:extract_subtitles
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║             💬 Extract Subtitles from MKV                 ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

if not exist "Subtitles" mkdir "Subtitles"

set /A count=0
for %%f in (*.mkv) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No MKV files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% MKV file(s)
echo.
echo    💬 Extracting subtitles...
echo.

set /A i=0
set /A success=0
set /A failed=0

for %%f in (*.mkv) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    💬 EXTRACT [!i!/%count%]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    
    ffmpeg -i "%%f" -map 0:s:0 "Subtitles\%%~nf.srt" -hide_banner -loglevel error
    
    if !ERRORLEVEL! neq 0 (
        echo    ❌ FAILED: No subtitles or error
        set /A failed+=1
    ) else (
        echo    ✅ SUCCESS: %%~nf.srt
        set /A success+=1
    )
    echo.
)

echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                    📋 Operation Summary                   ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    📊 Total: %count% ^| ✅ Success: %success% ^| ❌ Failed: %failed%
echo    📂 Output: Subtitles folder
echo.
echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:show_info
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                   📊 File Information                     ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

set /A count=0
for %%f in (*.mkv) do set /A count+=1

if %count%==0 (
    echo    ⚠️  No MKV files found!
    echo.
    pause
    goto menu
)

echo    📁 Found %count% MKV file(s)
echo.

set /A i=0
for %%f in (*.mkv) do (
    set /A i+=1
    echo    ═══════════════════════════════════════════════════════════
    echo    📄 FILE [!i!]: %%~nf
    echo    ═══════════════════════════════════════════════════════════
    ffmpeg -i "%%f" -hide_banner 2>&1 | findstr /i "Duration Video Audio Subtitle"
    echo.
)

echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:compare_sizes
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║            📈 Compare File Sizes (Before/After)           ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.

echo    🔍 Scanning for converted files...
echo.

if exist "MP4_Best\*.*" (
    echo    💎 Best Mode
    call :show_comparison "MP4_Best"
)

if exist "MP4_Fast\*.*" (
    echo    ⚡ Fast Mode
    call :show_comparison "MP4_Fast"
)

if exist "MP4_Quality\*.*" (
    echo    🎨 Quality Mode
    call :show_comparison "MP4_Quality"
)

if exist "MP4_Compressed\*.*" (
    echo    📦 Compressed Mode
    call :show_comparison "MP4_Compressed"
)

if exist "MP4_Balanced\*.*" (
    echo    ⚖️  Balanced Mode
    call :show_comparison "MP4_Balanced"
)

echo    ═══════════════════════════════════════════════════════════
pause
goto menu

:show_comparison
set folder=%~1
for %%f in (*.mkv) do (
    if exist "%folder%\%%~nf.mp4" (
        echo       📁 %%~nf:
        echo          Original: %%~zf bytes
        for %%g in ("%folder%\%%~nf.mp4") do echo          Converted: %%~zg bytes
        echo.
    )
)
goto :eof

:clean_folders
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                  🧹 Clean Output Folders                  ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    ⚠️  WARNING: This will delete all output folders!
echo.
echo    📂 Folders to be deleted:
echo       • MP4_Best
echo       • MP4_Fast
echo       • MP4_Quality
echo       • MP4_Compressed
echo       • MP4_Balanced
echo       • Audio_*
echo       • Subtitles
echo.
echo    ═══════════════════════════════════════════════════════════
set /p confirm="    ❓ Are you sure? (Y/N): "

if /i "%confirm%"=="Y" (
    echo.
    echo    🧹 Cleaning folders...
    
    if exist "MP4_Best" rmdir /s /q "MP4_Best"
    if exist "MP4_Fast" rmdir /s /q "MP4_Fast"
    if exist "MP4_Quality" rmdir /s /q "MP4_Quality"
    if exist "MP4_Compressed" rmdir /s /q "MP4_Compressed"
    if exist "MP4_Balanced" rmdir /s /q "MP4_Balanced"
    if exist "Audio_MP3_192" rmdir /s /q "Audio_MP3_192"
    if exist "Audio_MP3_320" rmdir /s /q "Audio_MP3_320"
    if exist "Audio_AAC" rmdir /s /q "Audio_AAC"
    if exist "Audio_FLAC" rmdir /s /q "Audio_FLAC"
    if exist "Subtitles" rmdir /s /q "Subtitles"
    
    echo    ✅ All output folders cleaned!
) else (
    echo    ❌ Operation cancelled
)

echo.
pause
goto menu

:settings
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║                     ⚙️  Settings                          ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    ℹ️  Current Settings:
echo       • FFmpeg: Installed
echo       • Console Encoding: UTF-8
echo.
echo    ┌───────────────────────────────────────────────────────────┐
echo    │                    📋 REQUIREMENTS                        │
echo    └───────────────────────────────────────────────────────────┘
echo.
echo    Required Software:
echo       🎬 FFmpeg (Video processing)
echo          Download: https://ffmpeg.org/download.html
echo          Windows: https://github.com/BtbN/FFmpeg-Builds/releases
echo.
echo    Optional:
echo       🚀 Hardware Acceleration (NVIDIA/AMD/Intel)
echo          Faster encoding with GPU support
echo.
echo    ┌───────────────────────────────────────────────────────────┐
echo    │                  📖 TECHNICAL INFO                        │
echo    └───────────────────────────────────────────────────────────┘
echo.
echo    Conversion Modes:
echo.
echo    💎 Best Mode
echo       • CRF: 18 (Excellent quality)
echo       • Preset: fast
echo       • Audio: 256 kbps AAC
echo       • Use: Archival, professional work
echo.
echo    ⚡ Fast Mode
echo       • Direct stream copy
echo       • No re-encoding
echo       • Use: Quick format conversion
echo.
echo    🎨 Quality Mode
echo       • CRF: 20
echo       • Preset: medium
echo       • Audio: 192 kbps AAC
echo       • Use: General purpose high quality
echo.
echo    📦 Compress Mode
echo       • CRF: 23
echo       • Preset: fast
echo       • Audio: 128 kbps AAC
echo       • Use: Reduce file size
echo.
echo    ⚖️  Balanced Mode
echo       • CRF: 20
echo       • Preset: medium
echo       • Audio: 160 kbps AAC
echo       • Use: Best quality/size ratio
echo.
echo    ═══════════════════════════════════════════════════════════
echo    Press any key to return to main menu...
pause >nul
goto menu

:end
cls
echo.
echo    ╔═══════════════════════════════════════════════════════════╗
echo    ║           🎉 Thank you for using this program!            ║
echo    ╚═══════════════════════════════════════════════════════════╝
echo.
echo    👤 Author: Abdelrahman Ayman
echo    🔗 GitHub: https://github.com/Abdelrahman968
echo.
echo    ⭐ If you found this useful, please star the repository!
echo.
echo    ═══════════════════════════════════════════════════════════
echo.
timeout /t 3 >nul
exit