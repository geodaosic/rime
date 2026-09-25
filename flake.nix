{

  description = "Frost-Calcifying Wind";

  inputs = {
    
    # Repositories
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Frameworks
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: {
    # non-nixos
    homeConfigurations.emily = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ ./home-manager/home.nix ];
    }; 
     
    nixosConfigurations = {
      hostname = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
	      pkgs-unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
	    };
        modules = [
    	  ./configuration.nix
  	      home-manager.nixosModules.home-manager {
  	        home-manager.useGlobalPkgs = true;
  	        home-manager.useUserPackages = true;
  	        home-manager.users.emily = ./home-manager/home.nix;
	        home-manager.extraSpecialArgs = {
	          pkgs-unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
	        };
  	      }
        ];
      };
    };
  };  
}
