# Traffic Light Controller with Pedestrian Mode
This project presents a Verilog-based Traffic Light Controller designed using Finite State Machine (FSM) concepts. The system controls traffic signals for two roads and includes a pedestrian crossing mode to ensure safe road crossing.
The controller uses timer-based state transitions and latches pedestrian requests to prevent missed crossing signals. The design is fully simulated and verified using a Verilog testbench.

# 🚦 Features
- Traffic signal control for two roads
- Pedestrian crossing mode
- FSM-based system design
- Timer-controlled state transitions
- Pedestrian request latching mechanism
- Verilog simulation with testbench verification
- Synthesizable and modular design
# 🛠️ Project Concepts
- Finite State Machines (FSM)
- Sequential & Combinational Logic
- Clock-Driven Digital Systems
- State Transition Control
- Timer and Register Operations
# ⚙️ Inputs & Outputs
## Inputs
1. clk → Clock signal
2. reset → System reset
3. ped_req → Pedestrian request button
## Outputs
1. A_red, A_yellow, A_green
2. B_red, B_yellow, B_green
3. Ped_green
# 🔄 FSM States
## 1. A_G
Road A = Green
Road B = Red
## 2.A_Y
Road A = Yellow
Road B = Red
## 3. B_G
Road B = Green
Road A = Red
## 4. B_Y
Road B = Yellow
Road A = Red
## 5.PED
Both roads = Red
Pedestrian signal = Green
# 🚶 Pedestrian Request Handling
1. Pedestrian requests are stored using a latch signal
2. Requests remain active until served
3. System safely switches to pedestrian mode after traffic cycle completion
4. During pedestrian mode:
- Both roads remain red
- Pedestrian signal turns green
# ⏱️ Timer Operation
- 4-bit timer controls state duration
- Timer increments on each clock cycle
- State changes occur after predefined timing interval
# 📂 Project Files
ComputerArchitectureCodeFiles/
├── traffic_light_controller.v
├── testbench.v
# 💻 Technologies Used
- Verilog HDL
- FSM Design Methodology
- Digital Logic Design
- Computer Architecture Concepts
- Simulation & Testbench Verification
# 🧪 Testbench Verification
1. The testbench performs:
- Clock signal generation
- Reset initialization
- Pedestrian button simulation
- Output monitoring during simulation
2. Simulation confirms:
- Correct traffic light sequencing
- Proper pedestrian request handling
- Accurate FSM transitions
# ✅ Conclusion
This project successfully demonstrates the implementation of a Traffic Light Controller with Pedestrian Mode using Verilog and FSM concepts. The design ensures safe traffic flow, reliable pedestrian handling, and accurate state-based operation verified through simulation.
