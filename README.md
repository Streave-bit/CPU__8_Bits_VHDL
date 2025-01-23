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
1. **`alu.vhd`**  
   - Implements the Arithmetic and Logic Unit (ALU) for performing arithmetic and logical operations.  
   - Supports operations such as addition, subtraction, AND, OR, etc.

2. **`cpu.vhd`**  
   - Top-level module that integrates all CPU components and manages execution flow.  

3. **`cu.vhd`**  
   - The Control Unit (CU) orchestrates the CPU's operations by managing control signals for each module.  

4. **`gen_reg.vhd`**  
   - General-purpose registers for temporarily storing data during execution.  

5. **`mar.vhd`**  
   - Memory Address Register (MAR), used to store the memory location of data or instructions.  

6. **`mem.vhd`**  
   - Represents the memory module for storing both instructions and data.  

7. **`pc.vhd`**  
   - Program Counter (PC), which tracks the address of the next instruction to execute. .


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
   git clone https://github.com/Streave-bit/CPU_8_bit_VHDL.git
   cd CPU_8_bit_VHDL
   cd Testbench
   ghdl -e pc_tb
   ghdl -r pc_tb --vcd=waveform_pc.vcd
