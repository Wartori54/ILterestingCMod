// Refs are in the module file
.namespace Celeste.Mod.ILterestingCMod.Entities 
{
    .class public auto sealed ansi beforefieldinit JumpAccumulatorEntity
        extends [Celeste]Monocle.Entity 
    {
        .custom instance void class [Celeste]Celeste.Mod.Entities.CustomEntityAttribute::'.ctor'(string[])
        = ( 
        01 00 // Prolog: mandatory 
        01 00 00 00 // A single arg
        25 // string 37 bytes
        49 4c 74 65 72 65 73 74 69 6e 67 43 4d 6f 64 2f 4a 75 6d 70 41 63 63 75 6d 75 6c 61 74 6f 72 45 6e 74 69 74 79 // the string
        // The above string "ILterestingCMod/JumpAccumulatorEntity"
        00 00 // Named atributes: none
        )
        
        .custom instance void class [Celeste]Monocle.Tracked::'.ctor'(bool)
        = (
        01 00 // Prolog: mandatory
        00 // false
        00 00 // Named atributes: none
        )
        
        .field private static class [MonoMod.RuntimeDetour]MonoMod.RuntimeDetour.ILHook jumpilhook
        
        .field public static float32 accYSpeed // 1 player assumption, hell yeah!
        
        .method public specialname rtspecialname instance 
            void '.ctor' (class [Celeste]Celeste.EntityData data,
            valuetype [FNA]Microsoft.Xna.Framework.Vector2 offset) cil managed 
        {
            // Call the base ctor
            ldarg.0
            ldarg data
            ldfld valuetype [FNA]Microsoft.Xna.Framework.Vector2 [Celeste]Celeste.EntityData::Position
            ldarg offset
            call valuetype [FNA]Microsoft.Xna.Framework.Vector2 
                [FNA]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [FNA]Microsoft.Xna.Framework.Vector2, 
                valuetype [FNA]Microsoft.Xna.Framework.Vector2) // This is data.Position + offset
            call instance void [Celeste]Monocle.Entity::.ctor(valuetype [FNA]Microsoft.Xna.Framework.Vector2) 
            nop
            
            // Set the collider
            ldarg.0
            ldarg data
            ldstr "size"
            ldc.r4 0 // default param 2
            call instance float32 [Celeste]Celeste.EntityData::Float(string, float32)
            dup // Get two on the stack, this will be width and height
            dup // Center it via: -s/2
            ldc.r4 -1
            ldc.r4 2
            div
            mul
            dup // Get the other one
            newobj instance void [Celeste]Monocle.Hitbox::'.ctor'(float32, float32, float32, float32)
            call instance void [Celeste]Monocle.Entity::set_Collider(class [Celeste]Monocle.Collider) // Consumes the ldarg.0
            nop
            ret
        }
        
        .method public static hidebysig 
            void LoadHooks() cil managed
        {
            ldtoken [Celeste]Celeste.Player
            call class [System.Runtime]System.Type [System.Runtime]System.Type::GetTypeFromHandle(valuetype [System.Runtime]System.RuntimeTypeHandle)
            ldstr "Jump"
            call instance class [System.Runtime]System.Reflection.MethodInfo [System.Runtime]System.Type::GetMethod(string)
            ldnull
            ldftn void Celeste.Mod.ILterestingCMod.Entities.JumpAccumulatorEntity::JumpILHook(class [MonoMod.Utils]MonoMod.Cil.ILContext ctx)
            newobj instance void [MonoMod.Utils]MonoMod.Cil.ILContext/Manipulator::'.ctor'(object, native int)
            newobj instance void [MonoMod.RuntimeDetour]MonoMod.RuntimeDetour.ILHook::'.ctor'(class [System.Runtime]System.Reflection.MethodBase, class [MonoMod.Utils]MonoMod.Cil.ILContext/Manipulator)
            stsfld class [MonoMod.RuntimeDetour]MonoMod.RuntimeDetour.ILHook Celeste.Mod.ILterestingCMod.Entities.JumpAccumulatorEntity::jumpilhook
            ret
        }
        
        .method public static hidebysig
            void UnloadHooks() cil managed
        {
            ldsfld class [MonoMod.RuntimeDetour]MonoMod.RuntimeDetour.ILHook Celeste.Mod.ILterestingCMod.Entities.JumpAccumulatorEntity::jumpilhook
            callvirt instance void [System.Runtime]System.IDisposable::Dispose()
            ret
        }
        
        .method private static hidebysig
            void JumpILHook(class [MonoMod.Utils]MonoMod.Cil.ILContext ctx) cil managed 
        {
            .locals init (
                class [MonoMod.Utils]MonoMod.Cil.ILCursor cursor,
                class [System.Runtime]System.Reflection.MethodBase checkCol,
                class [Mono.Cecil]Mono.Cecil.Cil.Instruction brfalseInstr,
                class [System.Runtime]System.Reflection.FieldInfo SpeedFi,
                class [System.Runtime]System.Reflection.FieldInfo XFi,
                class [System.Runtime]System.Reflection.FieldInfo YFi,
                class [System.Runtime]System.Reflection.FieldInfo varJumpSpeedFi,
                class [System.Runtime]System.Reflection.FieldInfo accYSpeedFi
            )
            // Obtain the methodbase of the `Entity.CheckCollision<ThisEnity>`
            ldtoken Celeste.Mod.ILterestingCMod.Entities.JumpAccumulatorEntity
            call class [System.Runtime]System.Type [System.Runtime]System.Type::GetTypeFromHandle(valuetype [System.Runtime]System.RuntimeTypeHandle)
            ldstr "BetterCheckCollision"
            call instance class [System.Runtime]System.Reflection.MethodInfo [System.Runtime]System.Type::GetMethod(string)
            stloc checkCol
            
            ldtoken Celeste.Mod.ILterestingCMod.Entities.JumpAccumulatorEntity
            call class [System.Runtime]System.Type [System.Runtime]System.Type::GetTypeFromHandle(valuetype [System.Runtime]System.RuntimeTypeHandle)
            ldstr "accYSpeed"
            call instance class [System.Runtime]System.Reflection.FieldInfo [System.Runtime]System.Type::GetField(string)
            stloc accYSpeedFi
            
            // Obtain the fieldinfos for X and Y of Vector2
            ldtoken [FNA]Microsoft.Xna.Framework.Vector2
            call class [System.Runtime]System.Type [System.Runtime]System.Type::GetTypeFromHandle(valuetype [System.Runtime]System.RuntimeTypeHandle)
            dup
            ldstr "X"
            call instance class [System.Runtime]System.Reflection.FieldInfo [System.Runtime]System.Type::GetField(string)
            stloc XFi
            ldstr "Y"
            call instance class [System.Runtime]System.Reflection.FieldInfo [System.Runtime]System.Type::GetField(string)
            stloc YFi
            
            ldtoken [Celeste]Celeste.Player
            call class [System.Runtime]System.Type [System.Runtime]System.Type::GetTypeFromHandle(valuetype [System.Runtime]System.RuntimeTypeHandle)
            ldstr "Speed"
            call instance class [System.Runtime]System.Reflection.FieldInfo [System.Runtime]System.Type::GetField(string)
            stloc SpeedFi
            
            ldtoken [Celeste]Celeste.Player
            call class [System.Runtime]System.Type [System.Runtime]System.Type::GetTypeFromHandle(valuetype [System.Runtime]System.RuntimeTypeHandle)
            ldstr "varJumpSpeed"
            ldc.i4 36 // 0x24 NonPublic | Instance
            callvirt instance class [System.Runtime]System.Reflection.FieldInfo [System.Runtime]System.Type::GetField(string, valuetype [mscorlib]System.Reflection.BindingFlags)
            stloc varJumpSpeedFi 
    
            // Obtain the cursor
            ldarg ctx
            newobj instance void [MonoMod.Utils]MonoMod.Cil.ILCursor::'.ctor'(class [MonoMod.Utils]MonoMod.Cil.ILContext)
            stloc cursor
            
            // Get in position
            ldloc cursor
            ldc.i4.M1 // Go to last instr
            ldc.i4.0 // MoveType.Before
            ldc.i4.0
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::Goto(int32, valuetype [MonoMod.Utils]MonoMod.Cil.MoveType, bool)
            
            // Start emitting
            // ldarg.0
            // callvirt Entity.CheckCollision<ThisEntity>()
            // brfalse IL_ret
            // ldfld Player.Speed
            // ldarg.0
            // ldc.r4.0
            // ldarg.0
            // ldc.r4.0
            // stfld Vector2.X
            // stfld Vector2.Y
            // Notice the ilcursor recycling
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdarg0()
                
            ldloc checkCol
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitCall(class [System.Runtime]System.Reflection.MethodBase)
               
            dup // We are going to consume and not get a new one
            call instance class [Mono.Cecil]Mono.Cecil.Cil.Instruction [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::get_Next()
            
            // Emit the brfalse to the next instr, which is the ret
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitBrfalse(class [Mono.Cecil]Mono.Cecil.Cil.Instruction)
            
            // This causes the brfalse to jump to itself bc monomod is stupid, but keep it that way, we'll fix it later
            dup // We are going to consume the ilcursor
            call instance class [Mono.Cecil]Mono.Cecil.Cil.Instruction [MonoMod.Utils]MonoMod.Cil.ILCursor::get_Prev()
            stloc brfalseInstr
            
            // We still have an ilcursor in the stack here
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdarg0()
            ldloc SpeedFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdflda(class [System.Runtime]System.Reflection.FieldInfo)
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitDup()
            
            ldloc YFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdfld(class [System.Runtime]System.Reflection.FieldInfo)
            
            ldloc accYSpeedFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdsfld(class [System.Runtime]System.Reflection.FieldInfo)
                
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitAdd()
            
            ldloc accYSpeedFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitStsfld(class [System.Runtime]System.Reflection.FieldInfo)
            
            ldc.r4 0
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdcR4(float32)
            
            ldloc YFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitStfld(class [System.Runtime]System.Reflection.FieldInfo) // Consumes the dup
            
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdarg0()
                                    
            ldc.r4 0
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdcR4(float32)
            ldloc varJumpSpeedFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitStfld(class [System.Runtime]System.Reflection.FieldInfo)
            // First part done
            // Now jump to ret to not do the second part
            dup // We are going to consume and not get a new one
            call instance class [Mono.Cecil]Mono.Cecil.Cil.Instruction [MonoMod.Utils]MonoMod.Cil.ILCursor::get_Next()
            // Emit the brfalse to the next instr, which is the ret
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitBr(class [Mono.Cecil]Mono.Cecil.Cil.Instruction)
            // Fix it bc monomod fucked it up (the br jumps to itself), get the previous one (the br) and set its operand to the next one (the ret, currently)
            dup // We are going to consume the ilcursor
            call instance class [Mono.Cecil]Mono.Cecil.Cil.Instruction [MonoMod.Utils]MonoMod.Cil.ILCursor::get_Prev()
            ldloc cursor // We'll consume it again
            call instance class [Mono.Cecil]Mono.Cecil.Cil.Instruction [MonoMod.Utils]MonoMod.Cil.ILCursor::get_Next()
            call instance void [Mono.Cecil]Mono.Cecil.Cil.Instruction::set_Operand(object)
            
            // SECOND PART
            // Add the accumulated jump to the player
            // We still have an ilcursor in the stack here
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdarg0()
            
            // Fix the brfalse now, since we have the target instruction emitted
            ldloc brfalseInstr
            ldloc cursor
            call instance class [Mono.Cecil]Mono.Cecil.Cil.Instruction [MonoMod.Utils]MonoMod.Cil.ILCursor::get_Prev()
            call instance void [Mono.Cecil]Mono.Cecil.Cil.Instruction::set_Operand(object)
            
            ldloc SpeedFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdflda(class [System.Runtime]System.Reflection.FieldInfo) 
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitDup()
            ldloc YFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdfld(class [System.Runtime]System.Reflection.FieldInfo)
            ldloc accYSpeedFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdsfld(class [System.Runtime]System.Reflection.FieldInfo)
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitAdd()
            
            ldloc YFi // This consumes the original `Speed` pointer
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitStfld(class [System.Runtime]System.Reflection.FieldInfo)
                
            // Finally reset the accjmp
            ldc.r4 0
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitLdcR4(float32)
            ldloc accYSpeedFi
            call instance class [MonoMod.Utils]MonoMod.Cil.ILCursor [MonoMod.Utils]MonoMod.Cil.ILCursor
                ::EmitStsfld(class [System.Runtime]System.Reflection.FieldInfo)
            
            pop // Pop the final ilcursor
            
            ret
        }
        
        // Turns out reflecting generic methods is hard D:
        .method public static hidebysig
            bool BetterCheckCollision(class [Celeste]Celeste.Player player) cil managed
        {
            ldarg player // Check arg 1
            
            ldarg player
            callvirt instance class [Celeste]Monocle.Scene [Celeste]Monocle.Entity::get_Scene()
            callvirt instance class [Celeste]Monocle.Tracker [Celeste]Monocle.Scene::get_Tracker()
            callvirt instance class [System.Collections]System.Collections.Generic.Dictionary`2<class [System.Runtime]System.Type, class [System.Collections]System.Collections.Generic.List`1<class [Celeste]Monocle.Entity>> 
                 [Celeste]Monocle.Tracker::get_Entities()
            ldtoken Celeste.Mod.ILterestingCMod.Entities.JumpAccumulatorEntity
            call class [System.Runtime]System.Type [System.Runtime]System.Type::GetTypeFromHandle(valuetype [System.Runtime]System.RuntimeTypeHandle)
            callvirt instance !1 /*class [System.Collections]System.Collections.Generic.List`1<class [Celeste]Monocle.Entity>*/ 
                class [System.Collections]System.Collections.Generic.Dictionary`2<class [System.Runtime]System.Type, class [System.Collections]System.Collections.Generic.List`1<class [Celeste]Monocle.Entity>>
                ::get_Item(!0 /*class [System.Runtime]System.Type*/) // Check arg 2
            call bool [Celeste]Monocle.Collide::Check(class [Celeste]Monocle.Entity, class [System.Runtime]System.Collections.Generic.IEnumerable`1<class [Celeste]Monocle.Entity>)
            ret
        }
    }
}
