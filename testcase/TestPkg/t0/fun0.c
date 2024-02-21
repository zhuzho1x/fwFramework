#include <Base.h>
#include <PiPei.h>
#include <Library/HobLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/DebugLib.h>
#include <Library/UefiLib.h>

#include "fun0.h"

PCIE_FW_INST_CONTEXT* Pcie0;

UNIT_TEST_STATUS
EFIAPI
UnitTestPreReq (
  IN UNIT_TEST_CONTEXT Context
  )
{
    if (NULL == Pcie0) {
      Pcie0 = AllocateZeroPool (sizeof (PCIE_FW_INST_CONTEXT));
      UT_ASSERT_NOT_NULL (Pcie0);
    }

    return UNIT_TEST_PASSED;
}

UNIT_TEST_STATUS
EFIAPI
PrintHello (
  IN UNIT_TEST_CONTEXT Context
  )
{
    Print (L"Hello world!!!\n");
    
    return UNIT_TEST_PASSED;
}