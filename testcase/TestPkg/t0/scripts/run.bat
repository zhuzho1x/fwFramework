qemu-system-x86_64 -bios "D:\workarea\fw_validation\Build\OvmfX64\DEBUG_VS2019\FV\OVMF.fd" -hda fat:rw:"D:\workarea\fw_validation\Build\TestPkg\DEBUG_VS2019\X64" -net none -serial file:"D:\workarea\fw_validation\logs\debug.log"