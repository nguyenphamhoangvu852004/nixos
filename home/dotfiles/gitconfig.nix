{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "nguyenphamhoangvu852004";
        email = "nguyenphamhoangvu852004@gmail.com";
      };

      credential = {
        "https://github.com" = {
          helper = [
            ""
            "!gh auth git-credential"
          ];
        };

        "https://gist.github.com" = {
          helper = [
            ""
            "!gh auth git-credential"
          ];
        };
      };
    };
  };
}
