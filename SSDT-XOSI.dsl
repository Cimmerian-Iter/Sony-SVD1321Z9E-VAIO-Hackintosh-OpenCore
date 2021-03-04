/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLEwnipC.aml, Thu Mar  4 15:57:38 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000006B (107)
 *     Revision         0x02
 *     Checksum         0x4A
 *     OEM ID           "hack"
 *     OEM Table ID     "XOSI"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "XOSI", 0x00000000)
{
    External (_SB_.PCI0.LPC_.EC__, DeviceObj)

    Method (XOSI, 1, NotSerialized)
    {
        If (((Arg0 == "Windows 2012") && _OSI ("Darwin")))
        {
            Return (One)
        }

        Return (_OSI (Arg0))
    }
}

