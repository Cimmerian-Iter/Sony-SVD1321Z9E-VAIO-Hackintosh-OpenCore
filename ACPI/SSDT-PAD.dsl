/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL20p5Cf.aml, Thu Mar  4 15:58:44 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000049 (73)
 *     Revision         0x02
 *     Checksum         0xD6
 *     OEM ID           "DRTNIA"
 *     OEM Table ID     "GPI0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "GPI0", 0x00000000)
{
    External (S0ID, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            S0ID = One
        }
        Else
        {
        }
    }
}

