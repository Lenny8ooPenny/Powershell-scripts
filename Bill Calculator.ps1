#Bill Calc_U_L8R

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(369,435)
$Form.text                       = "Bill Calculator"
$Form.TopMost                    = $false

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Bill Calculator"
$Label1.AutoSize                 = $true
$Label1.width                    = 30
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(135,14)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',15)
$Label1.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(68,70)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Base Rent ="
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(65,85)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.text                   = "400"       #Base Rent
$TextBox1.width                  = 100
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(160,80)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "Electricity ="
$Label4.AutoSize                 = $true
$Label4.width                    = 25
$Label4.height                   = 10
$Label4.location                 = New-Object System.Drawing.Point(66,125)
$Label4.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $false
$TextBox2.text                   = ""            #Electricity
$TextBox2.width                  = 100
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(159,120)
$TextBox2.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = "Internet ="
$Label5.AutoSize                 = $true
$Label5.width                    = 25
$Label5.height                   = 10
$Label5.location                 = New-Object System.Drawing.Point(77,165)
$Label5.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox3                        = New-Object system.Windows.Forms.TextBox
$TextBox3.multiline              = $false
$TextBox3.text                   = ""            #Internet
$TextBox3.width                  = 100
$TextBox3.height                 = 20
$TextBox3.location               = New-Object System.Drawing.Point(159,160)
$TextBox3.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label6                          = New-Object system.Windows.Forms.Label
$Label6.text                     = "Trash ="
$Label6.AutoSize                 = $true
$Label6.width                    = 25
$Label6.height                   = 10
$Label6.location                 = New-Object System.Drawing.Point(92,205)
$Label6.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label7                          = New-Object system.Windows.Forms.Label
$Label7.text                     = "Water ="
$Label7.AutoSize                 = $true
$Label7.width                    = 25
$Label7.height                   = 10
$Label7.location                 = New-Object System.Drawing.Point(89,245)
$Label7.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label8                          = New-Object system.Windows.Forms.Label
$Label8.text                     = "Food ="
$Label8.AutoSize                 = $true
$Label8.width                    = 25
$Label8.height                   = 10
$Label8.location                 = New-Object System.Drawing.Point(87,285)
$Label8.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label9                          = New-Object system.Windows.Forms.Label
$Label9.text                     = "Other ="
$Label9.AutoSize                 = $true
$Label9.width                    = 25
$Label9.height                   = 10
$Label9.location                 = New-Object System.Drawing.Point(91,325)
$Label9.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox4                        = New-Object system.Windows.Forms.TextBox
$TextBox4.multiline              = $false
$TextBox4.text                   = ""            #Trash
$TextBox4.width                  = 100
$TextBox4.height                 = 20
$TextBox4.location               = New-Object System.Drawing.Point(157,200)
$TextBox4.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox5                        = New-Object system.Windows.Forms.TextBox
$TextBox5.multiline              = $false
$TextBox5.text                   = ""            #Water
$TextBox5.width                  = 100
$TextBox5.height                 = 20
$TextBox5.location               = New-Object System.Drawing.Point(159,240)
$TextBox5.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox6                        = New-Object system.Windows.Forms.TextBox
$TextBox6.multiline              = $false
$TextBox6.text                   = ""            #Food
$TextBox6.width                  = 100
$TextBox6.height                 = 20
$TextBox6.location               = New-Object System.Drawing.Point(159,280)
$TextBox6.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox7                        = New-Object system.Windows.Forms.TextBox
$TextBox7.multiline              = $false
$TextBox7.text                   = ""           #Other
$TextBox7.width                  = 100
$TextBox7.height                 = 20
$TextBox7.location               = New-Object System.Drawing.Point(159,320)
$TextBox7.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox8                        = New-Object system.Windows.Forms.TextBox
$TextBox8.multiline              = $false
$TextBox8.text                   = ""           #Total
$TextBox8.width                  = 100
$TextBox8.height                 = 20
$TextBox8.location               = New-Object System.Drawing.Point(157,364)
$TextBox8.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Total = "
$Button1.width                   = 60
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(87,358)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Button1.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")
$Button1.Add_Click({SumAll})
        function SumAll {
                        $Base = $TextBox1.text
                            $B = $Base -as[int]
                        $Electricity = $TextBox2.text
                            $E = $Electricity -as[int]
                        $Internet = $TextBox3.text
                            $I = $Internet -as[int]
                        $Trash = $TextBox4.text   
                            $T = $Trash -as[int] 
                        $Water = $TextBox5.text
                            $W = $Water -as[int]
                        $Food =  $TextBox6.text  
                            $F = $Food -as[int]
                        $Other = $TextBox7.text
                            $O = $Other -as[int]
                        
                        $SumAll = $B + $E + $I + $T + $W + $F + $O
                        $TextBox8.text = $SumAll
                        }
$Form.controls.AddRange(@($Label1,$Label2,$Label3,$TextBox1,$Label4,$TextBox2,$Label5,$TextBox3,$Label6,$Label7,$Label8,$Label9,$TextBox4,$TextBox5,$TextBox6,$TextBox7,$TextBox8,$Button1))

[void]$Form.ShowDialog()