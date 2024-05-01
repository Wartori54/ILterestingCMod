.assembly extern System.Runtime
{
  .ver 7:0:0:0
}
.assembly extern System.Console
{
  .ver 7:0:0:0
}
.assembly 'TestIL'
{
}

.module test.il

.namespace TestIL 
{
    .class public ansi auto beforefieldinit Program
            extends [mscorlib]System.Object
    {
    
    
        //.field public static void 'void' 
    
        
		.method public hidebysig 
		       static default void 'Main' () cil managed
		{
		    .maxstack 0
		    .entrypoint
		    call void TestIL.Program::'ILSupTest'()
		    call void TestIL.Program::'+'()
		    call void TestIL.Program::'1984'()
		    call void TestIL.Program::' '()
		    call void TestIL.Program::'Console.WriteLine()'()
		    call void TestIL.Program::'()'()
		    call void TestIL.Program::'\n'()
		    call void TestIL.Program::';()'()
		    newobj instance void TestIL.new::.ctor()
		    pop
		    ret
		}
		
		
        .field public static int32 '-'
        
		.method public hidebysig
		       static default void '+' () cil managed
		{
		    .maxstack 2
		    
		    IL_0019: ldsfld int32 TestIL.Program::'-'
		    IL_0020: ldc.i4.1
		    IL_0021: add
		    IL_0022: stsfld int32 TestIL.Program::'-'
		    IL_0023: ret
		}
		
		
		.field public static int32 '++'
		.field public static int32 'c++'
		.method public hidebysig
		        static default void ' ' () cil managed
		{
		    .maxstack 2
		    ldsfld int32 TestIL.Program::'++'
		    ldc.i4.1
		    add
		    stsfld int32 TestIL.Program::'++'
		    ldsfld int32 TestIL.Program::'c++'
		    ldc.i4.1
		    add
		    stsfld int32 TestIL.Program::'c++'
		    ret
		}
		
		.method public hidebysig
		        static default void 'Console.WriteLine()' () cil managed
		{
		    .maxstack 0
		    ret
		}
		
		.method public hidebysig
                static default void '()' () cil managed
        {
            .maxstack 0
            ret
        }
        
        .method public hidebysig
                static default void '\n' () cil managed
        {
            .maxstack 0
            ret
        }
        
        .method public hidebysig
                static default void ';()' () cil managed
        {
            .maxstack 0
            ret
        }
        
		
		.method public hidebysig
		        static default void '1984' () cil managed
		{
		    .maxstack 2
		    .locals init (
              int32 '-',
              int32 b
            )
            IL_0000: ldc.i4.5
            IL_0001: ldc.i4.1
            IL_0002: stloc b
            IL_0003: stloc '-'
            IL_0005: ldloc b
            IL_0006: ldloc '-'
            IL_0007: call void class [mscorlib]System.Console::WriteLine(int32)
            IL_0008: call void class [mscorlib]System.Console::WriteLine(int32)
            IL_0010: ldloc '-'
            IL_0011: ldc.i4.1
            IL_0012: add
            IL_0014: stloc '-'
            IL_0015: ldloc '-'
            IL_0016: dup
            IL_0017: call void class [mscorlib]System.Console::WriteLine(int32)
            IL_0018: call void class [mscorlib]System.Console::WriteLine(int32)
            IL_0019: ret
		}
		
		
		
		.method public hidebysig
		        static default void 'ILSupTest' () cil managed
		{
		    .maxstack 5
		    .locals init (
		        int32 a
		    )
		    IL_0000: ldc.i4.1
		    IL_0001: stloc a
		    IL_0004: ldloc a
		    IL_0005: brtrue.s IL_0010
		    IL_0006: ldc.i4.M1
		    IL_0010: ldstr "test"
		    IL_0011: call void class [mscorlib]System.Console::WriteLine(string)
		    IL_0020: ldloc a
		    IL_0021: brtrue.s IL_0100
		    IL_0023: call void class [mscorlib]System.Console::WriteLine(int32)
		    IL_0100: ret
		}
		
    }
    
    
    .class public ansi auto beforefieldinit 'new'
                extends [mscorlib]System.Object 
    {
        .method public hidebysig specialname rtspecialname instance void
            .ctor() cil managed
            {
            .maxstack 8
        
            IL_0000: ldarg.0      // this
            IL_0001: call         instance void [System.Runtime]System.Object::.ctor()
            IL_0006: nop
            IL_0007: ret
        
         } // end of method Program::.ctor
    }

}
