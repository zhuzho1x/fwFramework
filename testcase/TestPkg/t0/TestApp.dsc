## @file
#   Intel(r) UEFI Application Development Kit for EDK II.
#   This package contains applications which depend upon Standard Libraries
#   from the StdLib package.
#
#   See the comments in the [LibraryClasses.IA32] and [BuildOptions] sections
#   for important information about configuring this package for your
#   environment.
#
#   Copyright (c) 2010 - 2012, Intel Corporation. All rights reserved.<BR>
#   This program and the accompanying materials
#   are licensed and made available under the terms and conditions of the BSD License
#   which accompanies this distribution. The full text of the license may be found at
#   http://opensource.org/licenses/bsd-license.
#
#   THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#   WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
##

[Defines]
  PLATFORM_NAME                  = TestPkg
  PLATFORM_GUID                  = 0458dade-8b6e-4e45-b773-1b27cbda3e06
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010006
  OUTPUT_DIRECTORY               = Build/TestPkg
  SUPPORTED_ARCHITECTURES        = X64
  BUILD_TARGETS                  = DEBUG
  SKUID_IDENTIFIER               = DEFAULT

[PcdsFixedAtBuild.common]
  #gPcAtChipsetPkgTokenSpaceGuid.PcdAcpiIoBarEnableMask| 0x80
  #gPcAtChipsetPkgTokenSpaceGuid.PcdAcpiIoPciBarRegisterOffset|0x0040
  #gPcAtChipsetPkgTokenSpaceGuid.PcdAcpiIoPciBusNumber| 0x00
  #gPcAtChipsetPkgTokenSpaceGuid.PcdAcpiIoPciDeviceNumber| 0x1F 
  #gPCAtChipsetPkgTokenSpaceGuid.PcdAcpiIoPciEnableRegisterOffset|0x0044
  #gPcAtChipsetPkgTokenSpaceGuid.PcdAcpiIoPciFunctionNumber| 0x00
  #gPcAtChipsetPkgTokenSpaceGuid.PcdAcpiIoPortBaseAddress|0x0400 
  #gPcAtChipsetPkgTokenSpaceGuid.PcdAcp1IoPortBaseAddressMask/OxFFFC 
  #gPcAtChipsetPkgTokenSpaceGuid.PcdAcpiPm1TmrOffset |0x0008
  #gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80000000

[SkuIds]
  0|DEFAULT

[LibraryClasses]
  #
  # Entry Point Libraries
  #
  UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf

  #
  # Basic
  #
  RegisterFilterLib|MdePkg/Library/RegisterFilterLibNull/RegisterFilterLibNull.inf
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  PciExpressLib|MdePkg/Library/BasePciExpressLib/BasePciExpressLib.inf
  Pcilib|MdePkg/Library/BasePciLibPciExpress/BasePciLibPciExpress.inf
  PcisegmentLib|MdePkg/Library/BasePciSegmentLibPci/BasePciSegmentLibPci.inf
  #
  # UEFI & PI
  #
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
  DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  #
  # Misc
  #
  DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf
  # for debug message in serial out
  SerialPortLib|PcAtChipsetPkg/Library/SerialIoLib/SerialIoLib.inf
  DebugLib|MdePkg/Library/BaseDebugLibSerialPort/BaseDebugLibSerialPort.inf
  # for debug message in console out
  DebugLib|MdePkg/Library/UefiDebugLibConOut/UefiDebugLibConOut.inf
  #
  # for Unit Test
  #
  UnitTestLib|UnitTestFrameworkPkg/Library/UnitTestLib/UnitTestLib.inf
  UnitTestPersistenceLib|UnitTestFrameworkPkg/Library/UnitTestPersistenceLibNull/UnitTestPersistenceLibNull.inf
  UnitTestResultReportLib|UnitTestFrameworkPkg/Library/UnitTestResultReportLib/UnitTestResultReportLibDebugLib.inf
  NULL|UnitTestFrameworkPkg/Library/UnitTestDebugAssertLib/UnitTestDebugAssertLib.inf
 
[LibraryClasses.common.DXE_RUNTIME_DRIVER, LibraryClasses.common.UEFI_DRIVER, LibraryClasses.common.DXE_DRIVER, LibraryClasses.common.UEFI_APPLICATION]
  PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  ReportStatusCodeLib|MdeModulePkg/Library/DxeReportStatusCodeLib/DxeReportStatusCodeLib.inf
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
  TimerLib|PcAtChipsetPkg/Library/AcpiTimerLib/DxeAcpiTimerLib.inf
  
[LibraryClasses.common.UEFI_APPLICATION]
  #
  # for Unit Test
  #
  UnitTestResultReportLib|UnitTestFrameworkPkg/Library/UnitTestResultReportLib/UnitTestResultReportLibConOut.inf

[Components]
  testcase/TestPkg/t0/TestApp.inf

[Buildoptions]
  # 
  # for Unit Test
  #
  MSFT:*_*_*_CC_FLAGS  = -D DISABLE_NEW_DEPRECATED_INTERFACES -D EDKII_UNIT_TEST_FRAMEWORK_ENABLED /GL- /Gw- /Od /G$999999
  GCC: *_*_*_CC_FLAGS  = -D DISABLE_NEW_DEPRECATED_INTERFACES -D EDKII_UNIT_TEST_FRAMEWORK_ENABLED -Wno-error=unuseg-but-set-variable
  XCODE:*_*_*_CC_FLAGS = -D DISABLE_NEW_DEPRECATED_INTERFACES -D EDKII_UNIT_TEST_FRAMEWORK_ENABLED