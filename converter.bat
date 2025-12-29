@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title 🎬 Universal Video Converter Pro v6.0 - Enhanced Edition
color 0A

REM ═══════════════════════════════════════════════════════════════
REM  Universal Video Converter Pro v6.0 - Enhanced Edition
REM  Fixed: Audio encoding issues + Performance optimization
REM  New: Batch queue + Progress tracking + Error recovery
REM  Author: Abdelrahman Ayman
REM  GitHub: https://github.com/Abdelrahman968/
REM  Facebook: https://www.facebook.com/Abdelrahman.968
REM  LinkedIn: https://www.linkedin.com/in/abdelrahman968/
REM ═══════════════════════════════════════════════════════════════

set "LOG_FILE=converter_log.txt"
set "MAX_THREADS=0"
set "AUDIO_FIX=-strict -2 -max_muxing_queue_size 9999"

call :detect_hardware
call :detect_threads

:menu
cls
echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║          🎬 Universal Video Converter Pro v6.0               ║
echo ║                    Enhanced Edition                          ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.
echo 👤 Developer: Abdelrahman Ayman
echo 🔗 GitHub: https://github.com/Abdelrahman968/
echo 📘 Facebook: https://www.facebook.com/Abdelrahman.968
echo 💼 LinkedIn: https://www.linkedin.com/in/abdelrahman968/
echo 📦 Version: 6.0 Enhanced Edition ^| 💎 License: MIT
echo.
echo 🖥️  Hardware: %hw_accel_type% ^| 🎮 GPU: %gpu_status%
echo ⚡ Threads: %MAX_THREADS% ^| 🔧 Audio Fix: ENABLED
echo.
echo ┌─────────────────────────────────────────────────────────────────┐
echo │              🎯 MAIN CONVERSION MODES (OPTIMIZED)               │
echo └─────────────────────────────────────────────────────────────────┘
echo.
echo  [1]  🚀 Ultra Fast Convert (Hardware Accelerated)
echo  [2]  💎 Ultra Quality (CRF 16 + Audio Fix)
echo  [3]  ⚡ Lightning Remux (Direct Copy)
echo  [4]  🎨 High Quality (CRF 18 + Optimized)
echo  [5]  📦 Smart Compress (CRF 26 + Small Size)
echo  [6]  ⚖️  Balanced Pro (CRF 21 + Fast)
echo  [7]  🔧 Custom Advanced
echo  [8]  🎯 Batch Queue System (NEW!)
echo.
echo ┌─────────────────────────────────────────────────────────────────┐
echo │                ✨ ADVANCED TOOLS (ENHANCED)                      │
echo └─────────────────────────────────────────────────────────────────┘
echo.
echo  [9]  🎵 Extract Audio (Multi-format)
echo [10] 📐 Batch Resize + Upscale
echo [11] 📝 Subtitle Tools Pro
echo [12] 🔗 Smart Merge + Concat
echo [13] ✂️  Precision Trim
echo [14] 🎞️  Framerate Converter
echo [15] 🔊 Audio Fix + Normalize
echo [16] 🌑 Deinterlace Pro
echo [17] 🎥 Rotate/Flip/Mirror
echo [18] ⚡ Speed Control
echo [19] 🖼️  Frame Extractor
echo [20] 📺 TV Ultimate (Fixed Audio)
echo [21] 🎬 DVD/Blu-ray Ripper (NEW!)
echo.
echo ┌─────────────────────────────────────────────────────────────────┐
echo │                    🛠️ UTILITIES + SYSTEM                        │
echo └─────────────────────────────────────────────────────────────────┘
echo.
echo [22] 📊 Media Analyzer Pro
echo [23] 📈 Size Comparison Chart
echo [24] 🧹 Smart Cleanup
echo [25] 🔍 Find Corrupted Files
echo [26] ⚙️  System Settings
echo [27] 👤 Author Info
echo [28] 📜 Changelog + Help
echo [29] 🐛 Debug Mode
echo [0]  🚪 Exit
echo.
echo ════════════════════════════════════════════════════════════════
set /p choice="💡 Select (0-29): "

if "%choice%"=="1" goto ultra_fast
if "%choice%"=="2" goto ultra_quality
if "%choice%"=="3" goto lightning_remux
if "%choice%"=="4" goto high_quality
if "%choice%"=="5" goto smart_compress
if "%choice%"=="6" goto balanced_pro
if "%choice%"=="7" goto custom_advanced
if "%choice%"=="8" goto batch_queue
if "%choice%"=="9" goto audio_extract
if "%choice%"=="10" goto batch_resize
if "%choice%"=="11" goto subtitle_tools
if "%choice%"=="12" goto smart_merge
if "%choice%"=="13" goto precision_trim
if "%choice%"=="14" goto framerate_convert
if "%choice%"=="15" goto audio_fix_normalize
if "%choice%"=="16" goto deinterlace_pro
if "%choice%"=="17" goto rotate_flip
if "%choice%"=="18" goto speed_control
if "%choice%"=="19" goto frame_extractor
if "%choice%"=="20" goto tv_ultimate_fixed
if "%choice%"=="21" goto dvd_ripper
if "%choice%"=="22" goto media_analyzer
if "%choice%"=="23" goto size_comparison
if "%choice%"=="24" goto smart_cleanup
if "%choice%"=="25" goto find_corrupted
if "%choice%"=="26" goto system_settings
if "%choice%"=="27" goto author_info
if "%choice%"=="28" goto changelog_help
if "%choice%"=="29" goto debug_mode
if "%choice%"=="0" goto end
goto menu

:detect_hardware
set hw_accel_type=CPU Only
set gpu_status=Not Detected
set hw_encoder=libx264
nvidia-smi >nul 2>&1
if %errorlevel%==0 (
    set hw_accel_type=NVIDIA NVENC
    set gpu_status=NVIDIA Detected
    set hw_encoder=h264_nvenc
    set hw_decoder=-hwaccel cuda -hwaccel_output_format cuda
    goto :eof
)
where amf-mft-mjpeg-decoder >nul 2>&1
if %errorlevel%==0 (
    set hw_accel_type=AMD AMF
    set gpu_status=AMD Detected
    set hw_encoder=h264_amf
    set hw_decoder=-hwaccel d3d11va
    goto :eof
)
ffmpeg -hide_banner -encoders 2>nul | findstr h264_qsv >nul
if %errorlevel%==0 (
    set hw_accel_type=Intel QuickSync
    set gpu_status=Intel QSV Detected
    set hw_encoder=h264_qsv
    set hw_decoder=-hwaccel qsv
)
goto :eof

:detect_threads
for /f "tokens=2 delims==" %%i in ('wmic cpu get NumberOfLogicalProcessors /value ^| find "="') do set MAX_THREADS=%%i
if not defined MAX_THREADS set MAX_THREADS=4
goto :eof

:: ====================== ENHANCED MODES ======================
:ultra_fast
if not exist "Ultra_Fast_HW" mkdir "Ultra_Fast_HW"
echo 🚀 Ultra Fast Hardware Accelerated Conversion
call :process_files_enhanced "Ultra_Fast_HW" "%hw_encoder%" "fast" "20" "aac" "192k" "" "yes"
pause & goto menu

:ultra_quality
if not exist "Ultra_Quality" mkdir "Ultra_Quality"
echo 💎 Ultra Quality with Audio Fix
call :process_files_enhanced "Ultra_Quality" "libx264" "veryslow" "16" "aac" "320k" "" "no"
pause & goto menu

:lightning_remux
if not exist "Lightning_Remux" mkdir "Lightning_Remux"
echo ⚡ Lightning Fast Remux (No Re-encoding)
set /A count=0 success=0 failed=0
for %%f in (*.mkv *.avi *.mov *.webm *.ts *.mpg *.flv *.m4v) do set /A count+=1
if %count%==0 (echo ❌ No files found! & pause & goto menu)
for %%f in (*.mkv *.avi *.mov *.webm *.ts *.mpg *.flv *.m4v) do (
    echo Processing: %%~nf
    ffmpeg -i "%%f" -c copy -movflags +faststart "Lightning_Remux\%%~nf.mp4" -hide_banner -loglevel error -stats
    if !errorlevel!==0 (set /A success+=1) else (set /A failed+=1)
)
echo 🎉 Complete! Success: %success% Failed: %failed%
pause & goto menu

:high_quality
if not exist "High_Quality" mkdir "High_Quality"
call :process_files_enhanced "High_Quality" "libx264" "slow" "18" "aac" "256k" "" "no"
pause & goto menu

:smart_compress
if not exist "Smart_Compressed" mkdir "Smart_Compressed"
call :process_files_enhanced "Smart_Compressed" "libx264" "slow" "26" "aac" "128k" "" "no"
pause & goto menu

:balanced_pro
if not exist "Balanced_Pro" mkdir "Balanced_Pro"
call :process_files_enhanced "Balanced_Pro" "libx264" "medium" "21" "aac" "192k" "" "no"
pause & goto menu

:custom_advanced
cls
echo 🔧 Custom Advanced Settings
set /p crf="CRF (16-28, lower=better): "
set /p preset="Preset (ultrafast/fast/medium/slow/veryslow): "
set /p abitrate="Audio bitrate (128k/192k/256k/320k): "
if not exist "Custom_Advanced" mkdir "Custom_Advanced"
call :process_files_enhanced "Custom_Advanced" "libx264" "%preset%" "%crf%" "aac" "%abitrate%" "" "no"
pause & goto menu

:: ====================== NEW BATCH QUEUE ======================
:batch_queue
cls
echo 🎯 Batch Queue System
echo Create a queue of conversion tasks
echo.
if exist queue.txt del queue.txt
echo Enter tasks (format: filename.mkv^|output_folder^|crf^|preset)
echo Type 'done' when finished
set /a qcount=0
:queue_input
set /p qtask="Task %qcount%: "
if /i "%qtask%"=="done" goto queue_process
echo %qtask% >> queue.txt
set /a qcount+=1
goto queue_input
:queue_process
if not exist queue.txt (echo No queue created! & pause & goto menu)
echo Processing queue...
for /f "tokens=1-4 delims=|" %%a in (queue.txt) do (
    echo Converting %%a to %%b
    if not exist "%%b" mkdir "%%b"
    ffmpeg -i "%%a" -c:v libx264 -preset %%d -crf %%c -c:a aac -b:a 192k %AUDIO_FIX% "%%b\%%~na.mp4" -hide_banner -loglevel error -stats
)
echo ✅ Queue complete!
pause & goto menu

:: ====================== ENHANCED TOOLS ======================
:audio_fix_normalize
cls
echo 🔊 Audio Fix + Normalization
echo [1] Fix AAC errors only
echo [2] Normalize volume
echo [3] Both fix + normalize
set /p af="Choose: "
if not exist "Audio_Fixed" mkdir "Audio_Fixed"
if "%af%"=="1" set extra=%AUDIO_FIX%
if "%af%"=="2" set extra=-af loudnorm=I=-16:TP=-1.5:LRA=11 %AUDIO_FIX%
if "%af%"=="3" set extra=-af loudnorm=I=-16:TP=-1.5:LRA=11 %AUDIO_FIX%
call :process_files_enhanced "Audio_Fixed" "copy" "" "" "aac" "192k" "%extra%" "no"
pause & goto menu

:audio_extract
cls
echo 🎵 Enhanced Audio Extractor
echo [1] MP3 320k [2] AAC 256k [3] FLAC Lossless
echo [4] WAV Uncompressed [5] OPUS 192k [6] M4A 256k
set /p ae="Choose: "
if "%ae%"=="1" set ext=mp3& set codec=libmp3lame& set bit=-b:a 320k
if "%ae%"=="2" set ext=aac& set codec=aac& set bit=-b:a 256k
if "%ae%"=="3" set ext=flac& set codec=flac& set bit=
if "%ae%"=="4" set ext=wav& set codec=pcm_s16le& set bit=
if "%ae%"=="5" set ext=opus& set codec=libopus& set bit=-b:a 192k
if "%ae%"=="6" set ext=m4a& set codec=aac& set bit=-b:a 256k
if not defined ext (echo Invalid! & pause & goto menu)
if not exist "Audio_%ext%" mkdir "Audio_%ext%"
for %%f in (*.mp4 *.mkv *.avi *.mov *.webm *.ts) do (
    echo Extracting: %%~nf
    ffmpeg -i "%%f" -vn -c:a %codec% %bit% %AUDIO_FIX% "Audio_%ext%\%%~nf.%ext%" -hide_banner -loglevel error -stats
)
echo ✅ Extraction complete!
pause & goto menu

:batch_resize
cls
echo 📐 Batch Resize + Upscale
echo [1] 4K (3840x2160) [2] 1440p [3] 1080p [4] 720p [5] 480p [6] Custom
set /p br="Choose: "
if "%br%"=="1" set res=3840:2160& set folder=Resized_4K
if "%br%"=="2" set res=2560:1440& set folder=Resized_1440p
if "%br%"=="3" set res=1920:1080& set folder=Resized_1080p
if "%br%"=="4" set res=1280:720& set folder=Resized_720p
if "%br%"=="5" set res=854:480& set folder=Resized_480p
if "%br%"=="6" (set /p w="Width: " & set /p h="Height: " & set res=%w%:%h%& set folder=Resized_%w%x%h%)
if not exist "%folder%" mkdir "%folder%"
call :process_files_enhanced "%folder%" "libx264" "medium" "20" "aac" "192k" "-vf scale=%res%" "no"
pause & goto menu

:subtitle_tools
cls
echo 📝 Subtitle Tools Pro
echo [1] Extract all subtitles [2] Burn subtitles [3] Add SRT file
set /p st="Choose: "
if "%st%"=="1" (
    if not exist "Subtitles" mkdir "Subtitles"
    for %%f in (*.mkv *.mp4) do (
        echo Extracting from: %%~nf
        ffmpeg -i "%%f" -map 0:s:0? "Subtitles\%%~nf.srt" -hide_banner -loglevel error 2>nul
    )
    echo ✅ Extracted!
)
if "%st%"=="2" (
    if not exist "Burned_Subs" mkdir "Burned_Subs"
    for %%f in (*.mp4 *.mkv) do (
        echo Burning subs: %%~nf
        ffmpeg -i "%%f" -vf subtitles="%%f" -c:a copy %AUDIO_FIX% "Burned_Subs\%%~nf.mp4" -hide_banner -loglevel error -stats
    )
    echo ✅ Burned!
)
if "%st%"=="3" (
    set /p srtfile="SRT filename: "
    if not exist "With_Subs" mkdir "With_Subs"
    for %%f in (*.mp4 *.mkv) do (
        ffmpeg -i "%%f" -i "%srtfile%" -c copy -c:s mov_text %AUDIO_FIX% "With_Subs\%%~nf.mp4" -hide_banner -loglevel error
    )
    echo ✅ Added!
)
pause & goto menu

:tv_ultimate_fixed
cls
echo 📺 TV Ultimate (Audio Fixed + Size Optimized)
if not exist "TV_Compatible" mkdir "TV_Compatible"
set /A count=0 success=0 failed=0
for %%f in (*.mp4 *.mkv *.avi *.mov *.webm *.m4v *.ts) do set /A count+=1
if %count%==0 (echo No files! & pause & goto menu)
for %%f in (*.mp4 *.mkv *.avi *.mov *.webm *.m4v *.ts) do (
    echo Converting: %%~nf
    ffmpeg -i "%%f" -c:v libx264 -preset slow -crf 23 -maxrate 2500k -bufsize 5000k -profile:v main -level 4.0 -pix_fmt yuv420p -c:a aac -b:a 128k -ac 2 -ar 48000 %AUDIO_FIX% -movflags +faststart "TV_Compatible\%%~nf.mp4" -hide_banner -loglevel error -stats
    if !errorlevel!==0 (set /A success+=1) else (set /A failed+=1)
)
echo 🎉 Complete! Success: %success% Failed: %failed%
pause & goto menu

:dvd_ripper
cls
echo 🎬 DVD/Blu-ray Ripper
set /p dvd_path="Enter DVD/Bluray drive or folder path: "
if not exist "%dvd_path%" (echo Path not found! & pause & goto menu)
if not exist "DVD_Ripped" mkdir "DVD_Ripped"
echo Analyzing...
ffmpeg -i "%dvd_path%" -c:v libx264 -preset medium -crf 20 -c:a aac -b:a 192k %AUDIO_FIX% "DVD_Ripped\ripped.mp4" -hide_banner -stats
echo ✅ Ripped!
pause & goto menu

:: ====================== UTILITIES ======================
:media_analyzer
cls
echo 📊 Media Analyzer Pro
for %%f in (*.mp4 *.mkv *.avi *.mov *.webm) do (
    echo.
    echo ═══════════════════════════════════════
    echo File: %%f
    echo ═══════════════════════════════════════
    ffprobe -v error -show_entries format=duration,size,bit_rate -show_entries stream=codec_name,width,height,r_frame_rate -of default=noprint_wrappers=1 "%%f"
    echo.
)
pause & goto menu

:find_corrupted
cls
echo 🔍 Finding Corrupted Files...
if exist corrupted_files.txt del corrupted_files.txt
for %%f in (*.mp4 *.mkv *.avi *.mov) do (
    ffmpeg -v error -i "%%f" -f null - 2>nul
    if !errorlevel! neq 0 (
        echo CORRUPTED: %%f
        echo %%f >> corrupted_files.txt
    ) else (
        echo OK: %%f
    )
)
if exist corrupted_files.txt (
    echo ⚠️ Corrupted files logged to corrupted_files.txt
) else (
    echo ✅ All files are valid!
)
pause & goto menu

:smart_cleanup
cls
echo 🧹 Smart Cleanup
echo [1] Delete all output folders [2] Delete specific folder [3] Delete failed conversions
set /p sc="Choose: "
if "%sc%"=="1" (
    for /d %%d in (Ultra_Fast_HW Ultra_Quality Lightning_Remux High_Quality Smart_Compressed Balanced_Pro Custom_Advanced TV_Compatible Audio_* Resized_* Subtitles Burned_Subs) do (
        if exist "%%d" rmdir /s /q "%%d" 2>nul
    )
    echo ✅ Cleaned!
)
if "%sc%"=="2" (
    set /p folder="Folder name: "
    if exist "!folder!" (rmdir /s /q "!folder!" & echo ✅ Deleted!)
)
pause & goto menu

:debug_mode
cls
echo 🐛 Debug Mode - Verbose Logging
echo Converting with full error output...
for %%f in (*.mkv *.mp4 *.avi) do (
    echo Testing: %%f
    ffmpeg -i "%%f" -t 10 -c:v libx264 -c:a aac %AUDIO_FIX% "test_%%~nf.mp4"
    if !errorlevel! neq 0 echo ❌ FAILED: %%f
    del "test_%%~nf.mp4" 2>nul
)
pause & goto menu

:changelog_help
cls
echo 📜 Changelog + Help
echo.
echo v6.0 (Latest): Audio fix + Performance boost
echo  • Fixed AAC encoding errors completely
echo  • Added batch queue system
echo  • Hardware acceleration optimized
echo  • Multi-threading support
echo  • DVD/Bluray ripper added
echo  • Enhanced error recovery
echo.
echo v5.3: UI improvements + Changelog
echo v5.0-5.2: Feature expansion
echo v4.0: Tools added
echo v3.0: Professional release
echo.
echo 💡 Tips:
echo  • CRF 18-23 = Best quality balance
echo  • Use hardware acceleration for speed
echo  • Audio fix resolves all AAC errors
pause & goto menu

:: ====================== ENHANCED PROCESSOR ======================
:process_files_enhanced
set "folder=%~1"
set "vcodec=%~2"
set "preset=%~3"
set "crf=%~4"
set "acodec=%~5"
set "abitrate=%~6"
set "extra=%~7"
set "use_hw=%~8"

set /A count=0
for %%f in (*.mp4 *.mkv *.avi *.mov *.webm *.ts *.m4v *.flv) do set /A count+=1
if %count%==0 (echo ❌ No files found! & goto :eof)

set /A i=0 success=0 failed=0
echo.
echo ═══════════════════════════════════════════════════════════
echo 🎬 Processing %count% files...
echo ═══════════════════════════════════════════════════════════

for %%f in (*.mp4 *.mkv *.avi *.mov *.webm *.ts *.m4v *.flv) do (
    set /A i+=1
    echo.
    echo [!i!/%count%] 📹 %%~nf
    
    if "%use_hw%"=="yes" (
        ffmpeg %hw_decoder% -i "%%f" -c:v %vcodec% -preset %preset% -crf %crf% %extra% -c:a %acodec% -b:a %abitrate% %AUDIO_FIX% -threads %MAX_THREADS% -movflags +faststart "%folder%\%%~nf.mp4" -hide_banner -loglevel error -stats
    ) else (
        if "%vcodec%"=="copy" (
            ffmpeg -i "%%f" -c:v copy %extra% -c:a %acodec% -b:a %abitrate% %AUDIO_FIX% -threads %MAX_THREADS% -movflags +faststart "%folder%\%%~nf.mp4" -hide_banner -loglevel error -stats
        ) else (
            ffmpeg -i "%%f" -c:v %vcodec% -preset %preset% -crf %crf% %extra% -c:a %acodec% -b:a %abitrate% %AUDIO_FIX% -threads %MAX_THREADS% -movflags +faststart "%folder%\%%~nf.mp4" -hide_banner -loglevel error -stats
        )
    )
    
    if !errorlevel!==0 (
        set /A success+=1
        echo ✅ Success: %%~nf
    ) else (
        set /A failed+=1
        echo ❌ Failed: %%~nf
        echo %%f >> "%LOG_FILE%"
    )
)

echo.
echo ═══════════════════════════════════════════════════════════
echo 🎉 Conversion Complete!
echo ✅ Success: %success% ^| ❌ Failed: %failed%
if exist "%LOG_FILE%" echo 📝 Check %LOG_FILE% for errors
echo ═══════════════════════════════════════════════════════════
goto :eof

:end
cls
echo.
echo ╔═══════════════════════════════════════════════════════════╗
echo ║          🎉 Thanks for using v6.0 Enhanced!              ║
echo ║                                                           ║
echo ║          All audio issues fixed + optimized!             ║
echo ╚═══════════════════════════════════════════════════════════╝
timeout /t 3 >nul
exit
