.namespace Celeste.Mod.ILterestingCMod.Entities 
{
    .class public auto ansi beforefieldinit DashfullAreaEntity
            extends [Celeste]Monocle.Entity 
    {
        .custom instance void class [Celeste]Celeste.Mod.Entities.CustomEntityAttribute::'.ctor'(string[])
        = ( 
        01 00 // Prolog: mandatory 
        01 00 00 00 // A single arg
        22 // string 22 bytes
        49 4c 74 65 72 65 73 74 69 6e 67 43 4d 6f 64 2f 44 61 73 68 66 75 6c 6c 41 72 65 61 45 6e 74 69 74 79 // the string
        // The above string "ILterestingCMod/DashfullAreaEntity"
        00 00 // Named atributes: none
        )
        // what the heck are those bytes you may ask, well its a string[], so it has two bytes of the array pfx
        // then a 4 byte int describing its length, and then the actual string, which contains a byte describing its length
        // and then the bytes
        
        .field private initonly class [Celeste]Celeste.PlayerCollider pc
        
        .method public specialname rtspecialname hidebysig
            instance default void '.ctor' (class [Celeste]Celeste.EntityData data,
            valuetype [FNA]Microsoft.Xna.Framework.Vector2 offset) cil managed
        {
            .maxstack 5

            // Step 1, call the base constructor
            IL_0000: ldarg.0 // this
            IL_1000: ldarg data
            IL_2000: ldfld valuetype [FNA]Microsoft.Xna.Framework.Vector2 [Celeste]Celeste.EntityData::Position
            IL_3000: ldarg offset
            IL_4000: call valuetype [FNA]Microsoft.Xna.Framework.Vector2 
                [FNA]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [FNA]Microsoft.Xna.Framework.Vector2, 
                valuetype [FNA]Microsoft.Xna.Framework.Vector2) // This is data.Position + offset
            IL_4100: call instance void [Celeste]Monocle.Entity::.ctor(valuetype [FNA]Microsoft.Xna.Framework.Vector2) 
            IL_4101: nop
            
            // Now add the sprite
            IL_4199: ldarg.0 // this
            IL_4200: ldsfld class [Celeste]Monocle.SpriteBank [Celeste]Celeste.GFX::SpriteBank
            IL_4201: ldstr "dashfullArea"
            // Uses the ldstr above
            IL_4202: callvirt instance class [Celeste]Monocle.Sprite [Celeste]Monocle.SpriteBank::Create(string)
            // Uses the ldarg.0
            IL_4203: call instance void [Celeste]Monocle.Entity::Add(class [Celeste]Monocle.Component)
            IL_4299: nop
            // Stack is clean :D
            
            
            // Finally add a colision box
            IL_4999: ldarg.0 // this
            IL_5000: ldc.r4 128
            IL_5001: ldc.r4 128
            IL_5002: ldc.r4 -64
            IL_5003: ldc.r4 -64
            // Uses the 4 constants above
            IL_5010: newobj instance void [Celeste]Monocle.Hitbox::.ctor(float32, float32, float32, float32)
            // Uses the ldarg.0 above
            IL_5011: call instance void [Celeste]Monocle.Entity::set_Collider(class [Celeste]Monocle.Collider)
            IL_5012: nop
            // Stack is clean :D
            
            // Assign the pc
            
            // Create it
            IL_6500: ldarg.0 // this
            IL_6501: ldarg.0 // this
            IL_6502: ldarg.0 // this
            IL_6503: ldarg.0 // this
            IL_6001: ldftn instance void class Celeste.Mod.ILterestingCMod.Entities.DashfullAreaEntity::OnPlayerCollision (class [Celeste]Celeste.Player) // Consumes ldarg.0 on IL_6500
            IL_6011: newobj instance void class [mscorlib]System.Action`1<class [Celeste]Celeste.Player>::'.ctor' (object, native int)
            IL_6012: ldnull
            IL_6013: ldnull
            IL_7000: newobj instance void [Celeste]Celeste.PlayerCollider::.ctor(
                class [System.Runtime]System.Action`1<class [Celeste]Celeste.Player>,
                class [Celeste]Monocle.Collider,
                class [Celeste]Monocle.Collider)
            // Assign it
            IL_8000: stfld class [Celeste]Celeste.PlayerCollider Celeste.Mod.ILterestingCMod.Entities.DashfullAreaEntity::pc // Consumes ldarg.0 on IL_6501
            // Add it
            IL_8001: ldfld class [Celeste]Celeste.PlayerCollider Celeste.Mod.ILterestingCMod.Entities.DashfullAreaEntity::pc // Consumes ldarg.0 on IL_6502
            IL_8002: call instance void [Celeste]Monocle.Entity::Add(class [Celeste]Monocle.Component) // Consumes ldarg.0 on IL_6503
            IL_9999: ret
        }
        
        .method public hidebysig 
            instance default void OnPlayerCollision (class [Celeste]Celeste.Player player) cil managed 
        {
            .maxstack 1
            IL_0010: ldarg player
            IL_0011: call instance bool [Celeste]Celeste.Player::RefillDash()
            IL_0012: pop
            IL_0004: ret
        }
    }
}