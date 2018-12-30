let
  site-generator = import ./site-generator {};

  site = import ./site { inherit site-generator; };

  jobs = {
    inherit site-generator;
    inherit site;
  };
in
  jobs
