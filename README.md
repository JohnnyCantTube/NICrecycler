# NICrecycler
Windows Utility to cycle enable/disable Physical Network Ports
A powerShell Script to 
1. find all Network Port Names and display them
2. let the user select a Network Port with a number list [#]
3. allow entry of an overall cycle time [X] (60 Sec default)
4. allow entry of the DISABLE time [Y} (1.5 Sec default)
5. allow entry of the enable delay time [Z] (3.5 Sec default)
6. Toggle the selected Physical Adapter Port [#} over total X seconds with Y disable delay and Z enable delay
7. exit the script gracefully leaving the Physical Port UP/Enabled

 Purpose: To Cycle the Physical Port when LLDP CDP or EDP are unavailable at the Network Hub Switch
so that a USER can trace a specific Jack back to a specific Network Hub Switch Port,
using the LINK and ACT LEDs on that Switch to identify the link.
The routine figures out specific Windows Port Naes, and helps a USER select the port.
Uses only a Windows Laptop (or Desktop) Ethernet Port as the ID tool without the need for
expensive handheld Network testing tool.

FreeWare use. Non-Commercial intent. Public and Personal use.
I could not find such a utility on the WWW.
Works with 10baseTX 1000baseTX 1000baseTX and the Fiber SX SFPs as well with longer outage delay.
Works with existing port LEDs and the users visual observation without extra costs.
Works with most Windows Versions, tested on Windows 11 22H2 as well. (Dell i7/Win 11 Pro/Realtek NIC/Linksys Switch)
Does not require a Human(Partner) at the laptop adapter while User inspects distant Switch;
the total time delay can be made long enough to walk over to the switch location in a Riser or Closet.

comments to radcomtech@outlook.com
I build my own Electronics Tools:
I plan to build a DIY test set just like this with two RJ45 ports and a DPDT reed relay driven slowly by a NE555 timer and 2N3904 running on a 9V battery;
but this physical Ethernet Twisted pair interrupter set still requires an active NIC to test towards the switch
and the software version here would accomplish the same objective without build cost.
