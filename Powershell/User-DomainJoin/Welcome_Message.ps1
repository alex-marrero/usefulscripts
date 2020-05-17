Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form

$Form.Text = "Welcome"

$Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")

$Form.Icon = $Icon


$Form.AutoScroll = $True

$Form.AutoSize = $True

$Form.AutoSizeMode = "GrowAndShrink"

    # or GrowOnly

    $Form.MinimizeBox = $False

$Form.MaximizeBox = $False

$Form.WindowState = "Normal"

    # Maximized, Minimized, Normal

$Form.SizeGripStyle = "Hide"

    # Auto, Hide, Show

$Form.ShowInTaskbar = $False

$Form.Opacity = 1.0

    # 1.0 is fully opaque; 0.0 is invisible

$Form.StartPosition = "CenterScreen"

    # CenterScreen, Manual, WindowsDefaultLocation, WindowsDefaultBounds, CenterParent

$Font = New-Object System.Drawing.Font("Times New Roman",36,[System.Drawing.FontStyle]:: Regular)

# Font styles are: Regular, Bold, Italic, Underline, Strikeout

$Form.Font = $Font

$Label = New-Object System.Windows.Forms.Label

$Label.Text = "Please wait your computer is finishing setup. Thank you."

$Label.AutoSize = $True

$Form.Controls.Add($Label)

$Form.ShowDialog()