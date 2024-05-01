// Refs are in the module file
.namespace Celeste.Mod.ILterestingCMod.Entities 
{
    .class public auto ansi beforefieldinit DashfullAreaEntity
        extends [Celeste]Monocle.Entity 
    {
        .custom instance void class [Celeste]Celeste.Mod.Entities.CustomEntityAttribute::'.ctor'(string[])
        = ( 
        01 00 // Prolog: mandatory 
        01 00 00 00 // A single arg
        22 // string 34 bytes (in hex, remember)
        49 4c 74 65 72 65 73 74 69 6e 67 43 4d 6f 64 2f 44 61 73 68 66 75 6c 6c 41 72 65 61 45 6e 74 69 74 79 // the string
        // The above string "ILterestingCMod/DashfullAreaEntity"
        00 00 // Named atributes: none
        )
        // what the heck are those bytes you may ask, well its a string[], so it has two bytes of the attribute pfx
        // then a 4 byte int describing its length, and then the actual string, which contains a byte describing its length
        // and then the bytes
        
        .field private initonly class [Celeste]Celeste.PlayerCollider pc
        
        .method public specialname rtspecialname hidebysig
            instance default void '.ctor' (class [Celeste]Celeste.EntityData data,
            valuetype [FNA]Microsoft.Xna.Framework.Vector2 offset) cil managed
        {
            // Step 1, call the base constructor
            ldarg.0 // this
            ldarg data
            ldfld valuetype [FNA]Microsoft.Xna.Framework.Vector2 [Celeste]Celeste.EntityData::Position
            ldarg offset
            call valuetype [FNA]Microsoft.Xna.Framework.Vector2 
                [FNA]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [FNA]Microsoft.Xna.Framework.Vector2, 
                valuetype [FNA]Microsoft.Xna.Framework.Vector2) // This is data.Position + offset
            call instance void [Celeste]Monocle.Entity::.ctor(valuetype [FNA]Microsoft.Xna.Framework.Vector2) 
            nop
            
            // Now add the sprite
            ldarg.0 // this
            ldsfld class [Celeste]Monocle.SpriteBank [Celeste]Celeste.GFX::SpriteBank
            ldstr "dashfullArea"
            // Uses the ldstr above
            callvirt instance class [Celeste]Monocle.Sprite [Celeste]Monocle.SpriteBank::Create(string)
            // Uses the ldarg.0
            call instance void [Celeste]Monocle.Entity::Add(class [Celeste]Monocle.Component)
            nop
            // Stack is clean :D
            
            
            // Finally add a colision box
            ldarg.0 // this
            ldc.r4 128
            ldc.r4 128
            ldc.r4 -64
            ldc.r4 -64
            // Uses the 4 constants above
            newobj instance void [Celeste]Monocle.Hitbox::.ctor(float32, float32, float32, float32)
            // Uses the ldarg.0 above
            call instance void [Celeste]Monocle.Entity::set_Collider(class [Celeste]Monocle.Collider)
            nop
            // Stack is clean :D
            
            // Assign the pc
            
            // Create it
            ldarg.0 // this 1
            ldarg.0 // this 2
            ldarg.0 // this 3
            ldarg.0 // this 4
            ldftn instance void class Celeste.Mod.ILterestingCMod.Entities.DashfullAreaEntity::OnPlayerCollision (class [Celeste]Celeste.Player) // Consumes ldarg.0 4
            newobj instance void class [mscorlib]System.Action`1<class [Celeste]Celeste.Player>::'.ctor' (object, native int)
            ldnull
            ldnull
            newobj instance void [Celeste]Celeste.PlayerCollider::.ctor(
                class [System.Runtime]System.Action`1<class [Celeste]Celeste.Player>,
                class [Celeste]Monocle.Collider,
                class [Celeste]Monocle.Collider)
            // Assign it
            stfld class [Celeste]Celeste.PlayerCollider Celeste.Mod.ILterestingCMod.Entities.DashfullAreaEntity::pc // Consumes ldarg.0 3
            // Add it
            ldfld class [Celeste]Celeste.PlayerCollider Celeste.Mod.ILterestingCMod.Entities.DashfullAreaEntity::pc // Consumes ldarg.0 2
            call instance void [Celeste]Monocle.Entity::Add(class [Celeste]Monocle.Component) // Consumes ldarg.0 1
            ret
        }
        
        .method public hidebysig 
            instance default void OnPlayerCollision (class [Celeste]Celeste.Player player) cil managed 
        {
            .maxstack 1
            ldarg player
            call instance bool [Celeste]Celeste.Player::RefillDash()
            pop
            ret
        }
    }
}