# Project: Design of an 8-bit CPU

This project is a simple implementation of an 8-bit CPU, inspired by a YouTube tutorial. The goal is to understand the basic concepts of a CPU using the VHDL language.

## Table of Contents
- Introduction
- CPU Components
  - Program Counter (PC)
- Tools Used
- How to Use This Project

## Introduction
This project implements a simple 8-bit CPU based on a YouTube tutorial. It is designed to help understand the fundamental concepts of a processor, including instruction handling, arithmetic and logic operations, and execution flow control.

## CPU Components
The CPU consists of the following modules:
- **Program Counter (PC):** Handles the address of the next instruction.
- **ALU (Arithmetic and Logic Unit):** Performs arithmetic and logical operations.
- **Registers:** Temporarily store data.
- **Control Unit:** Manages the flow of instructions.
- **Memory:** Stores instructions and data.

## Program Counter (PC)
The Program Counter (PC) is a register that contains the address of the next instruction to execute. It is updated at each clock cycle based on control signals.

### PC Features:
- **Reset:** Resets the PC to `0x00`.
- **Load:** Loads a new address into the PC.
- **Increment:** Increments the PC to point to the next instruction.

## Tools Used
- **GHDL:** An open-source VHDL simulator for compiling and simulating code.
- **GTKWave:** A waveform viewer for analyzing simulation results.

## How to Use This Project

### Prerequisites
- **GHDL:** Installed on your system.
- **GTKWave:** Installed to view waveforms.

### Steps to Simulate the PC
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/8-bit-cpu.git
   cd CPU_8_bit_VHDL
   cd Testbench
   ghdl -e pc_tb
   ghdl -r pc_tb --vcd=waveform_pc.vcd
