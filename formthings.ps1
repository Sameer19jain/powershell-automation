$form = New-Object System.Windows.Forms.Form

$form.Text = "My form"
$mybutton = New-Object System.Windows.Forms.Button
$mybutton.Text = "Click me"

$mybutton.Dock = "fill"
$mybutton.add_click({$form.Close()})

$form.Controls.Add($mybutton)

$form.Add_shown({$form.Activate()})
$form.ShowDialog()