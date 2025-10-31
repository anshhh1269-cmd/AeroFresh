# AeroFresh CAD README

Files (copy these into the same folder):
- AeroFresh_Base.scad
- AeroFresh_TopCover.scad
- AeroFresh_Components.scad
- AeroFresh_Assembly.scad

Open with OpenSCAD:
1. Place all files in one folder.
2. Open `AeroFresh_Assembly.scad` in OpenSCAD.
3. Press F5 to preview; press F6 to compile final model.
4. Use File → Export → Export as STL (or Step) as needed.

Scale & Key dimensions:
- Base diameter: 180 mm
- LED ring: 50 mm (r = 25 mm)
- Fan diameter: 50 mm (r = 25 mm)
- Top dome diameter: 140 mm, height ~50 mm
- Clearance inside dome for LED ring & fan: ~15–25 mm

Wiring legend (colors used in the 3D wiring visualization):
- **Red** = V+ (battery positive / 12 V or 5 V rails)
- **Black** = GND (common ground)
- **Blue** = LED data (WS2812B)
- **Green** = I²C (SDA / SCL)
- **Yellow** = control signals (MOSFET gates / PWM)

Hardware pin mapping (recommended final wiring for firmware):
- **ESP32**:
  - LED data → **GPIO 18**
  - Pump MOSFET gate → **GPIO 23**
  - Fan MOSFET gate → **GPIO 19**
  - MPU6050 SDA → **GPIO 21**
  - MPU6050 SCL → **GPIO 22**
  - Power: VIN → 5 V rail (from buck converter), GND → common ground

Power & voltage notes:
- LiPo (you said earlier 3S / 11.1 V) powers the 12 V fan and pump.
- Use a **buck converter** (not modeled) to make a stable **5 V** for:
  - ESP32 VIN (through the ESP32 on-board regulator if needed)
  - WS2812B LED ring (must be 5 V)
- TP4056 was modeled earlier as a single-board charger for **single-cell LiPo**; if you use a 3S pack, use an appropriate charger or balance charger instead. **Do not use a TP4056 on multi-cell packs.**
- For grant/CAD submission, clearly state the exact battery configuration you will buy — safety matters.

Scent path (mechanical):
- Reservoir sits under dome; silicone tubing (4 mm ID) goes from reservoir to pump inlet.
- Pump pressurizes airflow through tube into cotton pad chamber.
- Fan pulls air through pad and out the top vents/nozzle — disperses scent.


-- End of README --
