# End User Domain Join

This Solution is not pretty but was used when our Partner was preparing Company Devices but VPN tunnel had not yet been setup to automate during provisioning. Vendor would Prepare Devices and add the files in the locations specified. Here is what the experience looks like;

-Computer is Imaged
-Vendor places files in Specified Location. or files could be dropped in during imaging
-Computer is Turned off boxed and Shipped to End-User with Documentation to Connect the Device Hard-Wired to Corporate Network
-End-User Recieves Device and Turns on. If Instructions were followed and Device is Connected, Domain join occurs automatically
-If instuction were not followed, message will be Display on Desktop stating "Waiting for Network"
-Once Device connects Domain Join Script is kicked off.

Like stated above not the best solution but this was prior to Setting vendor up with VPN Tunnel to Automate this entire process removing steps required by Partner and End-user.

## Setup

>Place all Scripts but StartDJ.bat in in accessible location during unattended boot

>Add Start DJ.bat to RunOnce in Registry o can be placed by vendor in the Local Service Account used in unattend startup folder to kick off
