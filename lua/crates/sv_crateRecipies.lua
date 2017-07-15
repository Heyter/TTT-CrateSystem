--[[-------------------------------------------------------------------------
I wanted this to have its own file :)
---------------------------------------------------------------------------]]

GarrBearsCrates.CraftingTable = {
   // First type the item... Last one the item that they get.
   // { Item_One, Item_Two, { Item(s)_Receive} }
   { // Small Crate to Scrap Metal
      GarrBearsCrates.Crates.SmallCrate,
      GarrBearsCrates.Crates.SmallCrate, 
      
      { GarrBearsCrates.Item.Metals.ScrapMetal } 
   },

   { // Scrap Metal to Metal
      GarrBearsCrates.Item.Metals.ScrapMetal,
      GarrBearsCrates.Item.Metals.ScrapMetal, 
      { GarrBearsCrates.Item.Metals.Metal } 
   },
 
   { // Metal to Metal Stack
      GarrBearsCrates.Item.Metals.Metal,
      GarrBearsCrates.Item.Metals.Metal, 
      { GarrBearsCrates.Item.Metals.MetalStack } 
   },

   { // Metal to Metal Stack
      GarrBearsCrates.Item.Metals.MetalStack,
      GarrBearsCrates.Item.Metals.MetalStack, 
      { GarrBearsCrates.Item.Metals.CompactMetal } 
   },

   { // Metal to Small Key
      GarrBearsCrates.Item.Metals.CompactMetal,
      GarrBearsCrates.Item.Metals.CompactMetal, 
      { GarrBearsCrates.Keys.SmallKey } 
   },

   { // Small Key to Normal Key
      GarrBearsCrates.Keys.SmallKey,
      GarrBearsCrates.Keys.SmallKey,
      { GarrBearsCrates.NormalKey }
   },
   
   { // Normal Key to Big Key
      GarrBearsCrates.Keys.NormalKey,
      GarrBearsCrates.Keys.NormalKey,
      { GarrBearsCrates.BigKey }
   },

   { // Big Key to Super Key
      GarrBearsCrates.Keys.BigKey,
      GarrBearsCrates.Keys.BigKey,
      { GarrBearsCrates.Keys.SuperKey }
   },

   { // Make a Gun Item
      GarrBearsCrates.Item.Metals.ScrapMetal,
      GarrBearsCrates.Item.Metals.CompactMetal,
      { GarrBearsCrates.Item.WeaponMetals.GunItem }
   },

   { // Make a Fireing Pin
      GarrBearsCrates.Item.Metals.ScrapMetal,
      GarrBearsCrates.Item.Metals.Metal,
      { GarrBearsCrates.Item.WeaponMetals.FireingPin }
   },

   { // Make a Trigger
      GarrBearsCrates.Item.WeaponMetals.GunItem,
      GarrBearsCrates.Item.Metals.Metal,
      { GarrBearsCrates.Item.WeaponMetals.Trigger }
   },

   { // Barrel
      GarrBearsCrates.Item.Metals.CompactMetal,
      GarrBearsCrates.Item.Metals.Metal,
      { GarrBearsCrates.Item.WeaponMetals.Barrel }
   },

   { // Magazine
      GarrBearsCrates.Item.WeaponMetals.GunItem,
      GarrBearsCrates.Item.Metals.MetalStack,
      { GarrBearsCrates.Item.WeaponMetals.Magazine }
   },

   { // Ammo Half
      GarrBearsCrates.Item.WeaponMetals.Barrel,
      GarrBearsCrates.Item.WeaponMetals.Magazine,
      { GarrBearsCrates.Item.WeaponMetals.AmmoHalf }
   },

   { // Fireing Half
      GarrBearsCrates.Item.WeaponMetals.Magazine,
      GarrBearsCrates.Item.WeaponMetals.Trigger,
      { GarrBearsCrates.Item.WeaponMetals.FireingHalf }
   },
   
   { // Casing
      GarrBearsCrates.Item.WeaponMetals.FireingHalf,
      GarrBearsCrates.Item.WeaponMetals.GunItem,
      { GarrBearsCrates.Item.WeaponMetals.Casing }
   },

   { // GunShell
      GarrBearsCrates.Item.WeaponMetals.Casing ,
      GarrBearsCrates.Item.WeaponMetals.GunItem,
      { GarrBearsCrates.Item.WeaponMetals.GunShell }
   },

   { // Pistol
      GarrBearsCrates.Item.WeaponMetals.Casing,
      GarrBearsCrates.Item.WeaponMetals.Casing,
      { GarrBearsCrates.Weapons.Pistol }
   },

   { // Glock
      GarrBearsCrates.Item.WeaponMetals.GunShell,
      GarrBearsCrates.Item.WeaponMetals.Casing,
      { GarrBearsCrates.Weapons.Glock }
   },

   { // Degal
      GarrBearsCrates.Item.WeaponMetals.GunShell,
      GarrBearsCrates.Item.WeaponMetals.GunShell,
      { GarrBearsCrates.Weapons.Degal }
   },



}
