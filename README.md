# DTMF Dual-Mode System (Pynq-Z2)
This project implements a Dual-Tone Multi-Frequency (DTMF) signal generator and detector on a Xilinx Zynq platform. The system supports two modes:

Send Mode: Receives characters via UART and generates corresponding DTMF tones.

Receive Mode: Captures audio input, performs an FFT, and detects the DTMF key from frequency peaks.

## Features
Real-time DTMF tone generation via sine wave synthesis.

FFT-based DTMF detection from microphone input.

UART interface for input (send mode).

GPIO-based mode switching (hardware switch).

LED display to visualize detected keys in binary.

## Hardware Requirements
- Pynq-Z2 board
- Audio codec interface (I2S)
- GPIO for LED and switch
- USB-UART connection

## Dependencies
- Xilinx SDK BSP (GPIO, UART, Timer, Interrupt, I2S)
- [ARM CMSIS-DSP](Taak1app/src/Source) library for FFT
- Audio configuration utilities ([audio.h](Taak1app/src/audio.h))

## Usage
You can run the system in two ways:

### Option 1: Boot from SD Card
Copy [boot.bin](boot/BOOT.bin) to the root of a FAT32-formatted SD card.

Insert the SD card into the Zynq board and power it on.

UART output will confirm the system is running.

### Option 2: Flash via JTAG
Build & flash the Bitstream and ELF using Xilinx SDK/Vitis.

Launch the application on the board.

### Once Running:
Set the mode switch:

LOW = Send Mode

HIGH = Receive Mode

In Send Mode: Send characters over UART to play DTMF tones.

In Receive Mode: Input DTMF tones via mic; detected keys display on LEDs.

Monitor UART for feedback on mode, frequencies, and key detection.

## File Overview
**main()** – Initializes platform, UART, audio, GPIOs, timer, and mode loop

**Timer_ISR()** – Outputs audio samples during tone generation

**PlayDTMF()** – Generates dual-tone signal for a key

**DetectDTMFFrequency()** – Reads samples and detects DTMF key using FFT

**DisplayDTMFOnLED()** – Displays detected key on LED

**GetDTMFFrequencies()** – Maps key to tone frequencies

**matchDTMF()** – Matches detected frequencies to a known key

**sendingLoop() / receivingLoop()** – Mode-specific handlers

## Notes
Frequencies are clamped to avoid audio overflow.

Detection uses simple peak-matching within DTMF frequency ranges.

Tones play for 1 second per key in send mode.