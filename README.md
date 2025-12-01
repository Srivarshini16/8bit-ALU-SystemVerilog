# 8bit-ALU-SystemVerilog
🚀 Overview

This project implements an 8-bit Pipelined ALU capable of performing arithmetic and logical operations.
The ALU is written in SystemVerilog and verified with a complete testbench in ModelSim (Intel FPGA Starter Edition).

The design includes:

✔️ Combinational ALU logic

✔️ 1-cycle pipelined output register

✔️ Zero flag generation

✔️ Clock-driven testbench

✔️ Waveform-based functional verification

🧩 Features
🔧 Supported Operations
ALU_Sel	Operation	Description
000	ADD	A + B
001	SUB	A - B
010	AND	Bitwise AND
011	OR	Bitwise OR
100	XOR	Bitwise XOR
101	NOT	Bitwise NOT (A only)
110	SHL	Logical Shift Left
111	SHR	Logical Shift Right
🏗️ Architecture
💡 1. Combinational Block (result_comb)

Implements ALU logic using a case statement.

⚙️ 2. Pipeline Register (result_reg)

Registered output updated on posedge clk, giving the ALU a 1-cycle latency.

🔍 3. Zero Flag

Asserted when the pipelined output equals zero.

📂 Project Structure
📁 project/
│── alu.sv             # Main ALU design
│── tb_alu.sv          # Testbench
│── README.md
└── /waveforms         # Waveform screenshots (optional)

🧪 Simulation & Verification
✔ Written in SystemVerilog
✔ Simulated using ModelSim
✔ Clock generation: 100 MHz
✔ All signals added to wave window
✔ $monitor prints runtime logs
✔ Validated using multiple test vectors
🖥️ How to Run the Simulation
1️⃣ Compile
Compile → Compile All

2️⃣ Simulate
Simulate → Start Simulation
work → tb_alu

3️⃣ Add Signals
Objects → Select All → Add → To Wave → Signals

4️⃣ Run
run 500ns


or

run -all

📊 Waveform Explanation

When viewed in ModelSim:

result_comb updates immediately

result_reg and ALU_Out update 1 clock cycle later

Zero_Flag becomes HIGH when output is zero

Each ALU operation shows correct behavior
<img width="946" height="805" alt="image" src="https://github.com/user-attachments/assets/4afb0ac9-c995-49b9-a99d-ecac107b41a5" />


<img width="1892" height="1006" alt="image" src="https://github.com/user-attachments/assets/e0195743-043b-40ca-84b6-ad00fbc0ba84" />


✨ Example Output
Time= 50ns | A=10 | B=5 | Sel=000 | Out=15 | Zero=0
Time= 60ns | A=10 | B=5 | Sel=001 | Out=5  | Zero=0
Time= 70ns | A=10 | B=5 | Sel=010 | Out=0  | Zero=1
...

🛠️ Tools Used

SystemVerilog

ModelSim – Intel FPGA Starter Edition

Windows 10/11

Git/GitHub

🌟 Future Improvements

Add Carry, Overflow, and Parity flags

Add signed arithmetic

Add randomized testbench

Add functional coverage (SystemVerilog covergroups)

Implement multi-stage pipelining

👤 Author
Srivarshini
📍 India

⭐ If you like this project

Give it a star ⭐ on GitHub to support!
