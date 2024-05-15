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

8. Purpose: To Cycle the Physical Port when LLDP CDP or EDP are unavailable at the Network Hub Switch
9. so that a USER can trace a specific Jack back to a specific Network Hub Switch Port,
10. using the LINK and ACT LEDs on that Switch to identify the link.
11. The routine figures out specific Windows Port Naes, and helps a USER select the port.
12. Uses only a Windows Laptop (or Desktop) Ethernet Port as the ID tool without the need for
13. expensive handheld Network testing tool.

14. FreeWare use. Non-Commercial intent. Public and Personal use.
15. I could not find such a utility on the WWW.
16. Works with 10baseTX 1000baseTX 1000baseTX and the Fiber SX SFPs as well with longer outage delay.
17. Works with existing port LEDs and the users visual observation without extra costs.
18. Does not require a Human(Partner) at the laptop adapter while User inspects distant Switch;
19. the total time delay can be made long enough to walk over to the switch location in a Riser or Closet.
20.  
