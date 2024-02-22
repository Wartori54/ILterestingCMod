.assembly extern System.Runtime
{
  .ver 7:0:0:0
}
.assembly extern Celeste
{
  .ver 1:0:0:0
}
.assembly extern MonoMod.RuntimeDetour
{
  .ver 25:0:2:0
}
.assembly extern MonoMod.Utils
{
  .ver 25:0:3:0
}
.assembly extern Mono.Cecil
{
  .ver 0:11:4:0
}
.assembly extern MMHOOK_Celeste
{
  .ver 0:0:0:0
}
.assembly extern FNA
{
  .ver 23:3:0:0
}
.assembly extern System.Collections
{
  .ver 7:0:0:0
}
.assembly extern System.Console
{
  .ver 7:0:0:0
}
.assembly 'ILterestingCMod'
{
}

.module ilmod.dll

.namespace Celeste.Mod.ILterestingCMod
{
	.class public auto ansi beforefieldinit ILterestingCModModule
	    extends [Celeste]Celeste.Mod.EverestModule
	{
		.method public hidebysig specialname rtspecialname
				instance default void '.ctor' () cil managed
		{
			.maxstack 3
			IL_0000: ldstr "ILterestingCModModule"
			IL_1001: ldc.i4.2 // LogLevel.Info
			IL_2002: call void class [Celeste]Celeste.Mod.Logger::SetLogLevel(string, valuetype [Celeste]Celeste.Mod.LogLevel)
			IL_3003: nop
			IL_4004: ldc.i4.2 // LogLevel.Info
			IL_4100: ldstr "ILterestingCMod"
			IL_5004: ldstr "HI FROM IL IN CONSTRUCTOR!!!"
			IL_6005: call void class [Celeste]Celeste.Mod.Logger::Log(valuetype [Celeste]Celeste.Mod.LogLevel, string, string)
			IL_8007: ret
		}

		.method public virtual hidebysig
		        instance default void Load () cil managed
		{
		    .maxstack 1
			IL_0000: ldstr "HII FROM LOAD!!!"
			IL_0001: call void class [mscorlib]System.Console::WriteLine(string)
			IL_0002: ret

		}

        .method public virtual hidebysig
		        instance default void Unload () cil managed
		{
		    .maxstack 1
			IL_0000: ldstr "Oh this is boooring, bye!!!"
			IL_0001: call void class [mscorlib]System.Console::WriteLine(string)
			IL_0002: ret
		}
	}
}

