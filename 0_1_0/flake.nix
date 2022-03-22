{
  description = ''A beanstalkd work queue client library'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-beanstalkd-0_1_0.flake = false;
  inputs.src-beanstalkd-0_1_0.owner = "tormaroe";
  inputs.src-beanstalkd-0_1_0.ref   = "0_1_0";
  inputs.src-beanstalkd-0_1_0.repo  = "beanstalkd.nim.git";
  inputs.src-beanstalkd-0_1_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-beanstalkd-0_1_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-beanstalkd-0_1_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}