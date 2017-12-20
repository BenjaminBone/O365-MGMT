﻿#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: 6a9e1b2e-2e22-43e8-94fc-3186e226d8f9
# Source File: C:\Users\bbone\Google Drive\!Scripts\Sapien Projects\O365 User Management\O365-MGMT\O365 User Management.psproj
#------------------------------------------------------------------------
<#
    .NOTES
    --------------------------------------------------------------------------------
     Code generated by:  SAPIEN Technologies, Inc., PowerShell Studio 2016 v5.3.131
     Generated on:       12/8/2016 7:24 AM
     Generated by:       bbone
    --------------------------------------------------------------------------------
    .DESCRIPTION
        Script generated by PowerShell Studio 2016
#>


#region Source: Startup.pss
#----------------------------------------------
#region Import Assemblies.....
#----------------------------------------------
[void][Reflection.Assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][Reflection.Assembly]::Load('System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
#endregion Import Assemblies

#Define a Param block to use custom parameters in the project
#Param ($CustomParameter)

function Main {
<#
    .SYNOPSIS
        The Main function starts the project application.
    
    .PARAMETER Commandline
        $Commandline contains the complete argument string passed to the script packager executable.
    
    .NOTES
        Use this function to initialize your script and to call GUI forms.
		
    .NOTES
        To get the console output in the Packager (Forms Engine) use: 
		$ConsoleOutput (Type: System.Collections.ArrayList)
#>
	Param ([String]$Commandline)
		
	#--------------------------------------------------------------------------
	#TODO: Add initialization script here (Load modules and check requirements)
	
	
	#--------------------------------------------------------------------------
	
	if((Show-MainForm_psf) -eq 'OK')
	{
		
	}
	
	$script:ExitCode = 0 #Set the exit code for the Packager
}







#endregion Source: Startup.pss

#region Source: Globals.ps1
	#--------------------------------------------
	# Declare Global Variables and Functions here
	#--------------------------------------------
	
	
	#Sample function that provides the location of the script
	function Get-ScriptDirectory
	{
	<#
		.SYNOPSIS
			Get-ScriptDirectory returns the proper location of the script.
	
		.OUTPUTS
			System.String
		
		.NOTES
			Returns the correct path within a packaged executable.
	#>
		[OutputType([string])]
		param ()
		if ($null -ne $hostinvocation)
		{
			Split-Path $hostinvocation.MyCommand.path
		}
		else
		{
			Split-Path $script:MyInvocation.MyCommand.Path
		}
	}
	
	#Sample variable that provides the location of the script
	[string]$ScriptDirectory = Get-ScriptDirectory
	
	
	
#endregion Source: Globals.ps1

#region Source: MainForm.psf
function Show-MainForm_psf
{
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formO365UserManagement = New-Object 'System.Windows.Forms.Form'
	$buttonConnect = New-Object 'System.Windows.Forms.Button'
	$labelConnectTo0365 = New-Object 'System.Windows.Forms.Label'
	$textbox1 = New-Object 'System.Windows.Forms.TextBox'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$formO365UserManagement_Load={
		#TODO: Initialize Form Controls here
		
	}
	
	$buttonConnect_Click={
		#Button to Connect to MSOL & Exchange Online
		$textbox1.Text = "Connecting to O365"
		$UserCredential = Get-Credential
		$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
		Import-PSSession $Session
		
		$textbox1.Text = "onnecting to MSOL"
		Import-Module MSOnline
		$mycreds = get-credential
		New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $mycreds -Authentication Basic -AllowRedirection
		Connect-MsolService -Credential $mycreds
		
		$textbox1.text = "Connected!"
	}
		# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$formO365UserManagement.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
		$script:MainForm_textbox1 = $textbox1.Text
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonConnect.remove_Click($buttonConnect_Click)
			$formO365UserManagement.remove_Load($formO365UserManagement_Load)
			$formO365UserManagement.remove_Load($Form_StateCorrection_Load)
			$formO365UserManagement.remove_Closing($Form_StoreValues_Closing)
			$formO365UserManagement.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formO365UserManagement.SuspendLayout()
	#
	# formO365UserManagement
	#
	$formO365UserManagement.Controls.Add($buttonConnect)
	$formO365UserManagement.Controls.Add($labelConnectTo0365)
	$formO365UserManagement.Controls.Add($textbox1)
	$formO365UserManagement.AutoScaleDimensions = '6, 13'
	$formO365UserManagement.AutoScaleMode = 'Font'
	$formO365UserManagement.BackColor = 'White'
	$formO365UserManagement.ClientSize = '735, 548'
	$formO365UserManagement.Name = 'formO365UserManagement'
	$formO365UserManagement.Text = 'O365 User Management'
	$formO365UserManagement.add_Load($formO365UserManagement_Load)
	#
	# buttonConnect
	#
	$buttonConnect.Location = '648, 12'
	$buttonConnect.Name = 'buttonConnect'
	$buttonConnect.Size = '75, 23'
	$buttonConnect.TabIndex = 2
	$buttonConnect.Text = 'connect!'
	$buttonConnect.UseVisualStyleBackColor = $True
	$buttonConnect.add_Click($buttonConnect_Click)
	#
	# labelConnectTo0365
	#
	$labelConnectTo0365.AutoSize = $True
	$labelConnectTo0365.Location = '557, 17'
	$labelConnectTo0365.Name = 'labelConnectTo0365'
	$labelConnectTo0365.Size = '85, 13'
	$labelConnectTo0365.TabIndex = 1
	$labelConnectTo0365.Text = 'connect to 0365'
	#
	# textbox1
	#
	$textbox1.Location = '300, 41'
	$textbox1.Multiline = $True
	$textbox1.Name = 'textbox1'
	$textbox1.Size = '423, 495'
	$textbox1.TabIndex = 0
	$formO365UserManagement.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formO365UserManagement.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formO365UserManagement.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formO365UserManagement.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$formO365UserManagement.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $formO365UserManagement.ShowDialog()

}
#endregion Source: MainForm.psf

#Start the application
Main ($CommandLine)
