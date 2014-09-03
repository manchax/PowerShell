 $source = @"
 public class Circulo {
    public double Radio;
    public double Area() { 
        return System.Math.Pow(System.Math.PI * Radio, 2);
    }
    public double SphereVolume() {
        return System.Math.Pow(System.Math.PI * Radio, 3);
    }
    public double CilynderVolume(int height) { 
        return Area() * height;
    }
 }
"@

Add-Type -TypeDefinition $source

function CalculoCirculo() {
    Param ([Double] $Radio, [Double] $Height)
    $cir = New-Object Circulo  
    $cir.Radio = $radio
    [System.String]::Format("El area es: {0:n2}", $cir.Area())
    [System.String]::Format("Volumen: {0:n2}", $cir.SphereVolume())    
    [System.String]::Format("Area cilindro: {0:n2}", $cir.CilynderVolume($height))
    Remove-Variable cir
}

function Fibonacci([int] $position) {
    if ( $position -le 1 ) {
        return 1
    }    
    $n1 = Fibonacci($position - 1)
    $n2 = Fibonacci($position - 2)    
    return $n1 + $n2
}


$r = Read-Host "¿cuál es el radio del circulo?"
$h = Read-Host "¿cuál es la altura?"
CalculoCirculo -Radio $r -Height $h
Remove-Variable r,h
CalculoCirculo -Radio 5 -Height 10

$a = 0..14
for ( $i = 0; $i -lt 15; $i++ ) {    
    $a[$i] = Fibonacci($i)
}
$a | Get-Member
$a | Format-Table -AutoSize -Property 
    @{ Label="Position"; Expression={[System.Array]::IndexOf($a, $_)} },
    @{ Label="Value";    Expression={$_} }

Remove-Variable a
