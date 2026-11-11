{ ... }: {
  programs.git = {
    enable = true;
    userName = "nguyenphamhoangvu852004";
    userEmail = "nguyenphamhoangvu852004@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
