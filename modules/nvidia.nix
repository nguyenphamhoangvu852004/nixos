{ config, pkgs, ... }:
{

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Hữu ích cho Steam/Wine
  };

  hardware.nvidia = {
    modesetting.enable = true;

    # GTX 1650 thuộc Turing, hỗ trợ NVIDIA open kernel modules.
    open = true;

    nvidiaSettings = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # THAY bằng địa chỉ GPU thực tế của bạn.
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
