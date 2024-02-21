#include <Library/UnitTestLib.h>

typedef struct {
  UINT8 AgentIndex;
  UINT32 Id;

} PCIE_FW_INST_CONTEXT;

typedef struct {
    PCIE_FW_INST_CONTEXT* mPcie0;

} PCIE_FW_LINK_CONTEXT;


UNIT_TEST_STATUS
EFIAPI
UnitTestPreReq (
  IN UNIT_TEST_CONTEXT Context
  );

UNIT_TEST_STATUS
EFIAPI
PrintHello (
  IN UNIT_TEST_CONTEXT Context
  );