# Sony-SVD1321Z9E-VAIO-Hackintosh-OpenCore
A working Hackintosh made with OpenCore for the SVD1321Z9E VAIO laptop

You can find here my setup, source code of the ACPI ssdt patch can be found in the source code folder inside ACPI
DSDT-6.aml is the dumped DSDT for information purpose.
CimmerianVAIO.ioreg is also for information purpose.


# Introduction

If you're a SVD1321Z9E Vaio user (unlikely) who want to hackintosh it (even more unlikely) then the work has been done for you!
Well VAIO laptop are like the worst laptop to hackintosh and this one gave me so much troubles, even more because VAIO aren't really popular on the hackintosh world. If you google VAIO SVD hackintosh on google you will only find old post which contains nothing useful for us. 

Fortunately, I made it working but that wasn't without effort.

The first time I made it was with clover, I just took a config.plist from internet about a pc that had intel 4400 hd graphics (rehabman had some pre built config.plist) and followed the guide, at least I could boot to mac os and install it, but it was broken.

No GPU acceleration, no sound, no battery, no brightness control, no backlight, no internet

At least I could use mac os as it was to launch checkra1n.

Opencore was just released and it was still a question whenever we should chose clover or opencore, clover was the main choice since opencore was harder to setup, and clover had gui tools which made it more user friendly.

The problem is that clover was begnining to get old, and break through each minor mac os update. While on the other hand OpenCore had no problem. So I decided to make a switch to OpenCore and at the same time, have a working laptop instead of a broken desktop.

Opencore was indeed harder to configure, but at least I knew exactly what the config was like, what options I used, what was that and this and how it works. So I had a better understanding of my system instead of a prebuilt config.plist where I had no idea where to begin with. 

Fixing the gpu acceleration was my first task, no gpu acceleration made mac os looks worse than it actually was and the animations were slow and painful to watch. And having a HD4400 doesn't help, as it isn't natively supported by mac os. Worst, 4400 has always been tricky to set up and still this day I have 4400 users who come at me asking if I managed to get my 4400 working.

Seting up the values in the config.plist and faking the device to a 4600HD (natively supported and share the same driver) should have done the trick. But naa it refused to. Instead I got that ugly broken screen https://cdn.discordapp.com/attachments/349988041797926913/694183230378606652/image0.jpg

With the help of midi from the hackintosh server (who also had a vaio, and knew how painful those devices were to hackintosh) we went through a lot of troubleshooting to see what was the problem. And ofc as he said "fucking VAIO and their trash bios" because there is nothing useful, 3 option in the boot section in the bios so you had no control whatsoever. After some "fix" we finally found the problem. 
I installed teamviewer, booted with that graphic mess, logged in, then remote controled my hackintosh with my teamviewer on my phone.

Guess what? the screen was working on my phone I could see mac os perfectly while on my hackintosh nope.

So I downgraded the resolution, and as if it was "magic", the screen was working fine on my hackintosh! no more broken shit.
I put back the native resolution, and yep it works. So when I boot the resolution is broken, I have to log on then manually change the resolution twice to make the screen works like it should.

Ultimately I found another trick later because always using teamviewer means that I need a device with me everytime and it was annoying. When I put my laptop at sleep, then wake it, the screen is fixed. This is much better than having to use team viewer.

The battery was the toughest one to achieve. ACPI is hard to understand and rehabman tutorial is complex and not very user friendly especially for someone who doesn't code much apart python.
So yeah I had a pretty big time to get it work, actually 1 year. The first version I had made following rehabman tutorial was not working, even though I followed it carefully, then midi helped me fix it but still wasn't working and we were out of solutions. I asked the help of someone else in tonymacx86 forums who also tried to make a workig battery patch. Did not work
A fellow french user in a french hackintosh forum also tried to fix my Battery patch, first asking me to return to clover as he doesn't know yet how to use opencore, so I remade a full clover installation just for that (from scratch but it was fast since I knew already how to make a config.plist) and doesn't work.

We tested so much things without success that I basically left it as it was.

One year has passed I didn't really wanted to touch my hackintosh since I was frustrated, no wifi, no touchpad and no internet transformed my laptop as a desktop with a wired mouse, tetherme on my iphone to send wifi through usb to my hackintosh, and charging everytime since I couldn't know the battery %

I found u/Ragpit_mehmet on reddit in a battery patch thread who fixed the battery patch of another user, and asked him to help me on my patch. And we managed to fix it for good, with battery working fully!

It was a pretty big win because the battery patch was the biggest major step to achieve before having a working hackintosh for everyday use.

I fixed my touchpad after 3 days of testing by using voodooI2C+voodooRIM and editing the prebuilt ssdt the guide told me to use as it was incompatible with my machine (ssdt made for windows10 computer while my computer first launched with windows8)

There are still some issue with that config that I'll try to fix but the journey has been quite long to make this old piece of laptop working decently on mac os. I'm surprised that for a 2014 computer it still hold well mac os and run decently.


# SETUP

This setup is made to work with OpenCore 0.6.7, every OC update needs a config.plist update, I will update my config.plist everytime OC update, as long as I still use this computer of course. If I ever abandon it, use the ocvalidate tool from the opencore.zip to check what is needed to change in my config.plist to be set up for the newest OpenCore release.

-I would advise you first to read the dorthania guide for haswell laptop to know how things works and have a base opencore installation, I will not provide anything related to opencore installation, only specific VAIO files
-Download The ACPI folder to your OC folder, and put the config.plist inside the OC folder
-Download all the required kext, the one I use and listed in the config.plist are : https://cdn.discordapp.com/attachments/719817616511860821/817038765985759282/5A6B59DD-013E-4917-89A7-11AB3B856D82_4_5005_c.jpeg![image](https://user-images.githubusercontent.com/37327589/109977522-30aac480-7cfd-11eb-902f-3fb1de81865d.png)

There are some kext that I provide, which is USB mapping and some cpu tweaking to optimize the system. Download them
-Once it's done, it should be ready. You can try to boot 

# ISSUES

There is currently some issues with my config, check the issue tab to know more.



