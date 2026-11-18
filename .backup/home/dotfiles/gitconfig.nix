{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "nguyenphamhoangvu852004";
        email = "nguyenphamhoangvu852004@gmail.com";
      };

      init.defaultBranch = "main";

      credential.helper = [
        ""
        "!gh auth git-credential"
      ];
    };
  };
}
