For ($i=0; $i -le 100; $i++)
{
    If ($i -eq 0) {$i}
    ElseIf ($i % 3 -eq 0){
        If ($i % 5 -eq 0) {"BaroSello"}
        Else {"Baro"}
    }
    Else {
        If ($i % 5 -eq 0){
            "Sello"
        }
        Else {$i}
    }
}