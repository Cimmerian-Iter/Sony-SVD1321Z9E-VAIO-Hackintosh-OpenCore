//
// SSDT to rename PXSX, XHC1, EHC1, EHC2, and other conflicting device names
//
DefinitionBlock ("", "SSDT", 2, "CORP", "UsbReset", 0x00001000)
{
    /*
     * Start copying here if you're adding this info to an SSDT-USB-Reset!
     */

    External (_SB.PCI0, DeviceObj)

    External (_SB.PCI0.EHC1, DeviceObj)

    Scope(_SB.PCI0.EHC1)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }

    Scope(_SB.PCI0)
    {
        Device (EH01)
        {
            Name (_ADR, 0x001D0000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    /*
     * End copying here if you're adding this info to an SSDT-USB-Reset!
     */
}