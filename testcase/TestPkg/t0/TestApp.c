#include <Uefi.h>
#include <Library/UefiApplicationEntryPoint.h>
#include <Library/UefiLib.h>
#include <Library/DebugLib.h>
#include <Library/BaseLib.h>

#include "fun0.h"

#define UNIT_TEST_NAME  "PCIE FW Unit Test"
#define UNIT_TEST_VERSION  "0.1"

EFI_STATUS
EFIAPI
APiTestEntry (
  VOID
  )
{
    EFI_STATUS Status;
    UNIT_TEST_FRAMEWORK_HANDLE Framework;
    UNIT_TEST_SUITE_HANDLE PcieFwApiTests;

    PCIE_FW_INST_CONTEXT Pcie0;
    PCIE_FW_LINK_CONTEXT PcieInstLink;

    Framework = NULL;

    Pcie0.AgentIndex = 0;
    PcieInstLink.mPcie0 = &Pcie0;

    // Start setting up the test framework for running the tests.
    Status = InitUnitTestFramework (&Framework, UNIT_TEST_NAME, gEfiCallerBaseName, UNIT_TEST_VERSION);
    if (EFI_ERROR (Status)) {
      DEBUG ((DEBUG_ERROR, "Failed in InitUnitTestFramework. Status = %r\n", Status));
      goto EXIT;
    }

    // Poplate the PcieFwApiTests Unit Test Suite.
    Status = CreateUnitTestSuite (&PcieFwApiTests, Framework, "FW - API Test", "***", NULL, NULL);
    if (EFI_ERROR (Status)) {
      DEBUG ((DEBUG_ERROR, "Failed in CreateUnitTestSuite for FW API Tests"));
      Status = EFI_OUT_OF_RESOURCES;
      goto EXIT;
    }

    /*-----------Suite----------Description----------Name--------Function--------Pre-fun--------Post-fun--------Context*/
    //Note: Pre-fun和Post-fun这两个地方可以传函数，Pre-fun先执行，Post-fun后执行
    AddTestCase (PcieFwApiTests, "Function Descriptions", "Api Name", UnitTestPreReq, NULL, NULL, &Pcie0);
    AddTestCase (PcieFwApiTests, "fun0", "Output Hello world!!!", PrintHello, NULL, NULL, &Pcie0);

    // Execute the tests.
    Status = RunAllTestSuites (Framework);

EXIT:
  if (Framework) {
    FreeUnitTestFramework (Framework);
  }

  return Status;
}

EFI_STATUS
EFIAPI
ValidationFun0ApiEntry (
  IN EFI_HANDLE         ImageHandle,
  IN EFI_SYSTEM_TABLE   *SystemTable
  ) 
{
  Print (L"ValidationFun0ApiEntry () Start\n");
  APiTestEntry ();
  Print (L"ValidationFun0ApiEntry () End\n");
  return EFI_SUCCESS;
}