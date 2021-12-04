/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLWtZrRl.aml, Thu Mar  4 15:59:08 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000643 (1603)
 *     Revision         0x02
 *     Checksum         0xAB
 *     OEM ID           "hack"
 *     OEM Table ID     "batt"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "batt", 0x00000000)
{
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.BAT1, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.FCMD, FieldUnitObj)
    External (_SB_.PCI0.LPCB.SNC_, DeviceObj)
    External (_STX, MethodObj)    // 0 Arguments
    External (_STY, MethodObj)    // 0 Arguments
    External (B1ST, FieldUnitObj)
    External (CMD_, UnknownObj)
    External (CPB0, UnknownObj)
    External (ECRD, MethodObj)    // 1 Arguments
    External (FDP1, IntObj)
    External (RC__, UnknownObj)
    External (RCB0, UnknownObj)
    External (X149, MethodObj)    // 0 Arguments
    External (XBIF, MethodObj)    // 0 Arguments
    External (XBIX, MethodObj)    // 0 Arguments
    External (XBST, MethodObj)    // 0 Arguments
    External (XBTP, MethodObj)    // 0 Arguments

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }

    Scope (_SB.PCI0.LPCB.H_EC)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                _STX ()
            }
        }

        OperationRegion (ECFX, EmbeddedControl, Zero, 0xFF)
        Field (ECFX, ByteAcc, Lock, Preserve)
        {
            Offset (0x22), 
            FC00,   8, 
            FC01,   8, 
            DC00,   8, 
            DC01,   8, 
            DV00,   8, 
            DV01,   8, 
            Offset (0x2A), 
            RC00,   8, 
            RC01,   8, 
            FV00,   8, 
            FV01,   8, 
            AI00,   8, 
            AI01,   8, 
            Offset (0x38), 
            CC00,   8, 
            CC01,   8, 
            Offset (0x58), 
            PM00,   8, 
            PM01,   8, 
            Offset (0xB3), 
            PR00,   8, 
            PR01,   8
        }
    }

    Scope (_SB.PCI0.LPCB.H_EC.BAT1)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x1F)
            }
            Else
            {
                _STY ()
            }
        }

        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
        {
            If (_OSI ("Darwin"))
            {
                Name (BPKG, Package (0x0D)
                {
                    Zero, 
                    Ones, 
                    Ones, 
                    One, 
                    Ones, 
                    Ones, 
                    One, 
                    0x64, 
                    Zero, 
                    "", 
                    "", 
                    "Lion", 
                    "Sony Corporation"
                })
                If ((ECRD (RefOf (B1ST)) & 0x10))
                {
                    Return (BPKG) /* \_SB_.PCI0.LPCB.H_EC.BAT1._BIF.BPKG */
                }

                If (((B1B2 (DV00, DV01) && B1B2 (FC00, FC01)) && B1B2 (DC00, DC01)))
                {
                    BPKG [One] = (B1B2 (DC00, DC01) * 0x0A)
                    BPKG [0x02] = (B1B2 (FC00, FC01) * 0x0A)
                    BPKG [0x04] = B1B2 (DV00, DV01)
                    BPKG [0x05] = ((B1B2 (FC00, FC01) * 0x0A) / 
                        0x0A)
                    BPKG [0x07] = ((B1B2 (DC00, DC01) * 0x0A) / 
                        0x64)
                    BPKG [0x08] = ((B1B2 (DC00, DC01) * 0x0A) / 
                        0x64)
                }

                Return (BPKG) /* \_SB_.PCI0.LPCB.H_EC.BAT1._BIF.BPKG */
            }
            Else
            {
                XBIF ()
            }
        }

        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
        {
            If (_OSI ("Darwin"))
            {
                Name (PKG1, Package (0x04)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                PKG1 [Zero] = (ECRD (RefOf (B1ST)) & 0x07)
                If ((ECRD (RefOf (B1ST)) & 0x10))
                {
                    PKG1 [One] = Zero
                    PKG1 [0x02] = Zero
                    PKG1 [0x03] = Zero
                    Return (PKG1) /* \_SB_.PCI0.LPCB.H_EC.BAT1._BST.PKG1 */
                }

                Local0 = B1B2 (AI00, AI01)
                If ((Local0 & 0x8000))
                {
                    Local0 ^= 0xFFFF
                    Local0++
                }

                Local0 = (Local0 * B1B2 (FV00, FV01))
                Local0 = (Local0 / 0x03E8)
                PKG1 [One] = Local0
                PKG1 [0x02] = (B1B2 (RC00, RC01) * 0x0A)
                PKG1 [0x03] = B1B2 (FV00, FV01)
                Return (PKG1) /* \_SB_.PCI0.LPCB.H_EC.BAT1._BST.PKG1 */
            }
            Else
            {
                XBST ()
            }
        }

        Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
        {
            If (_OSI ("Darwin"))
            {
                Local0 = ((Arg0 / 0x0A) & 0xFFFF)
                PR00 = Local0
                PR01 = (Local0 >> 0x08)
            }
            Else
            {
                XBTP ()
            }
        }

        Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
        {
            If (_OSI ("Darwin"))
            {
                Name (BPKX, Package (0x14)
                {
                    Zero, 
                    Zero, 
                    Ones, 
                    Ones, 
                    One, 
                    Ones, 
                    Ones, 
                    One, 
                    Ones, 
                    0x00017318, 
                    0xEA60, 
                    0x3A98, 
                    0xEA60, 
                    0x3A98, 
                    0x64, 
                    Zero, 
                    "Reserved", 
                    "Reserved", 
                    "Lion", 
                    "Sony Corporation"
                })
                If ((B1ST & 0x10))
                {
                    Return (BPKX) /* \_SB_.PCI0.LPCB.H_EC.BAT1._BIX.BPKX */
                }

                If (((B1B2 (DV00, DV01) && B1B2 (FC00, FC01)) && B1B2 (DC00, DC01)))
                {
                    BPKX [0x02] = (B1B2 (DC00, DC01) * 0x0A)
                    BPKX [0x03] = (B1B2 (FC00, FC01) * 0x0A)
                    BPKX [0x05] = B1B2 (DV00, DV01)
                    BPKX [0x06] = ((B1B2 (FC00, FC01) * 0x0A) / 
                        0x0A)
                    BPKX [0x0E] = ((B1B2 (DC00, DC01) * 0x0A) / 
                        0x64)
                    BPKX [0x0F] = ((B1B2 (DC00, DC01) * 0x0A) / 
                        0x64)
                    BPKX [0x08] = B1B2 (CC00, CC01)
                }

                Return (BPKX) /* \_SB_.PCI0.LPCB.H_EC.BAT1._BIX.BPKX */
            }
            Else
            {
                XBIX ()
            }
        }
    }

    Scope (_SB.PCI0.LPCB.SNC)
    {
        Method (F149, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((CMD == Zero))
                {
                    RC = FDP1 /* External reference */
                }
                ElseIf ((CMD == One))
                {
                    RCB0 = ^^H_EC.FCMD /* External reference */
                }
                ElseIf ((CMD == 0x02))
                {
                    ^^H_EC.FCMD = CPB0 /* External reference */
                }
                ElseIf ((CMD == 0x03))
                {
                    RCB0 = (B1B2 (^^H_EC.PM00, ^^H_EC.PM01) / 0x64)
                }
                Else
                {
                    Noop
                }

                Return (Zero)
            }
            Else
            {
                X149 ()
            }
        }
    }
}

