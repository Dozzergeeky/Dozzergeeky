# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

function ConvertTo-ScriptExtent {
    <#
    .EXTERNALHELP ..\PowerShellEditorServices.Commands-help.xml
    #>
    [CmdletBinding()]
    [OutputType([System.Management.Automation.Language.IScriptExtent])]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'ByOffset')]
        [Alias('StartOffset', 'Offset')]
        [int] $StartOffsetNumber,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByOffset')]
        [Alias('EndOffset')]
        [int] $EndOffsetNumber,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByPosition')]
        [Alias('StartLine', 'Line')]
        [int] $StartLineNumber,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByPosition')]
        [Alias('StartColumn', 'Column')]
        [int] $StartColumnNumber,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByPosition')]
        [Alias('EndLine')]
        [int] $EndLineNumber,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByPosition')]
        [Alias('EndColumn')]
        [int] $EndColumnNumber,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByPosition')]
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByOffset')]
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByBuffer')]
        [Alias('File', 'FileName')]
        [string] $FilePath = $psEditor.GetEditorContext().CurrentFile.Path,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByBuffer')]
        [Alias('Start')]
        [Microsoft.PowerShell.EditorServices.Extensions.IFilePosition, Microsoft.PowerShell.EditorServices] $StartBuffer,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'ByBuffer')]
        [Alias('End')]
        [Microsoft.PowerShell.EditorServices.Extensions.IFilePosition, Microsoft.PowerShell.EditorServices] $EndBuffer,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'ByExtent')]
        [System.Management.Automation.Language.IScriptExtent] $Extent
    )
    begin {
        $fileContext = $psEditor.GetEditorContext().CurrentFile
        $emptyExtent = [Microsoft.PowerShell.EditorServices.Extensions.FileScriptExtent, Microsoft.PowerShell.EditorServices]::Empty
    }
    process {
        # Already a InternalScriptExtent, FileScriptExtent or is empty.
        $returnAsIs = $Extent -and
            ($Extent.StartOffset -or $Extent.EndOffset -or $Extent -eq $emptyExtent)

        if ($returnAsIs) {
            return $Extent
        }

        if ($StartOffsetNumber) {
            $startOffset = $StartOffsetNumber
            $endOffset = $EndOffsetNumber

            # Allow creating a single position extent with just the offset parameter.
            if (-not $EndOffsetNumber) {
                $endOffset = $startOffset
            }

            return [Microsoft.PowerShell.EditorServices.Extensions.FileScriptExtent, Microsoft.PowerShell.EditorServices]::FromOffsets(
                $fileContext,
                $startOffset,
                $endOffset)
        }

        if ($StartBuffer) {
            if (-not $EndBuffer) {
                $EndBuffer = $StartBuffer
            }

            return [Microsoft.PowerShell.EditorServices.Extensions.FileScriptExtent, Microsoft.PowerShell.EditorServices]::FromPositions(
                $fileContext,
                $StartBuffer.Line,
                $StartBuffer.Column,
                $EndBuffer.Line,
                $EndBuffer.Column)
        }

        # Allow piping a single line and column to get a zero length script extent.
        if ($PSBoundParameters.ContainsKey('StartColumnNumber') -and -not $PSBoundParameters.ContainsKey('EndColumnNumber')) {
            $EndColumnNumber = $StartColumnNumber
        }

        if ($PSBoundParameters.ContainsKey('StartLineNumber') -and -not $PSBoundParameters.ContainsKey('EndLineNumber')) {
            $EndLineNumber = $StartLineNumber
        }

        # Protect against zero as a value since lines and columns start at 1
        if (-not $StartColumnNumber) {
            $StartColumnNumber = 1
        }

        if (-not $StartLineNumber) {
            $StartLineNumber = 1
        }

        if (-not $EndLineNumber) {
            $EndLineNumber = 1
        }

        if (-not $EndColumnNumber) {
            $EndColumnNumber = 1
        }

        return [Microsoft.PowerShell.EditorServices.Extensions.FileScriptExtent, Microsoft.PowerShell.EditorServices]::FromPositions(
            $fileContext,
            $StartLineNumber,
            $StartColumnNumber,
            $EndLineNumber,
            $EndColumnNumber)
    }
}

# SIG # Begin signature block
# MIIoLQYJKoZIhvcNAQcCoIIoHjCCKBoCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCArNi6HQ5eMUAz9
# cXhU8YSv7SRI9434IV7YYDMjrPkUZaCCDXYwggX0MIID3KADAgECAhMzAAADrzBA
# DkyjTQVBAAAAAAOvMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjMxMTE2MTkwOTAwWhcNMjQxMTE0MTkwOTAwWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDOS8s1ra6f0YGtg0OhEaQa/t3Q+q1MEHhWJhqQVuO5amYXQpy8MDPNoJYk+FWA
# hePP5LxwcSge5aen+f5Q6WNPd6EDxGzotvVpNi5ve0H97S3F7C/axDfKxyNh21MG
# 0W8Sb0vxi/vorcLHOL9i+t2D6yvvDzLlEefUCbQV/zGCBjXGlYJcUj6RAzXyeNAN
# xSpKXAGd7Fh+ocGHPPphcD9LQTOJgG7Y7aYztHqBLJiQQ4eAgZNU4ac6+8LnEGAL
# go1ydC5BJEuJQjYKbNTy959HrKSu7LO3Ws0w8jw6pYdC1IMpdTkk2puTgY2PDNzB
# tLM4evG7FYer3WX+8t1UMYNTAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQURxxxNPIEPGSO8kqz+bgCAQWGXsEw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwMDEyKzUwMTgyNjAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzci
# tW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEG
# CCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0
# MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBAISxFt/zR2frTFPB45Yd
# mhZpB2nNJoOoi+qlgcTlnO4QwlYN1w/vYwbDy/oFJolD5r6FMJd0RGcgEM8q9TgQ
# 2OC7gQEmhweVJ7yuKJlQBH7P7Pg5RiqgV3cSonJ+OM4kFHbP3gPLiyzssSQdRuPY
# 1mIWoGg9i7Y4ZC8ST7WhpSyc0pns2XsUe1XsIjaUcGu7zd7gg97eCUiLRdVklPmp
# XobH9CEAWakRUGNICYN2AgjhRTC4j3KJfqMkU04R6Toyh4/Toswm1uoDcGr5laYn
# TfcX3u5WnJqJLhuPe8Uj9kGAOcyo0O1mNwDa+LhFEzB6CB32+wfJMumfr6degvLT
# e8x55urQLeTjimBQgS49BSUkhFN7ois3cZyNpnrMca5AZaC7pLI72vuqSsSlLalG
# OcZmPHZGYJqZ0BacN274OZ80Q8B11iNokns9Od348bMb5Z4fihxaBWebl8kWEi2O
# PvQImOAeq3nt7UWJBzJYLAGEpfasaA3ZQgIcEXdD+uwo6ymMzDY6UamFOfYqYWXk
# ntxDGu7ngD2ugKUuccYKJJRiiz+LAUcj90BVcSHRLQop9N8zoALr/1sJuwPrVAtx
# HNEgSW+AKBqIxYWM4Ev32l6agSUAezLMbq5f3d8x9qzT031jMDT+sUAoCw0M5wVt
# CUQcqINPuYjbS1WgJyZIiEkBMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkq
# hkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
# IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQg
# Q29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03
# a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akr
# rnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0Rrrg
# OGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy
# 4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9
# sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAh
# dCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8k
# A/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTB
# w3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmn
# Eyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90
# lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0w
# ggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2o
# ynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYD
# VR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBa
# BgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
# bC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsG
# AQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNV
# HSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsG
# AQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABl
# AG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKb
# C5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11l
# hJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6
# I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0
# wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560
# STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQam
# ASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGa
# J+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ah
# XJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA
# 9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33Vt
# Y5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr
# /Xmfwb1tbWrJUnMTDXpQzTGCGg0wghoJAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAOvMEAOTKNNBUEAAAAAA68wDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIPdDfua2HoHSC+WsA9Kd4vwx
# /69pMrly3wNqXl3Q9Zb6MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAQscY9ZMmaRPyU7Cq7OYqjIIeCFPcvIGo7XEzxIsFNxnClICRRrRboivn
# U55fmYMWp4N2/2mM0d/E0ImuOaVIbcZpVIL+suejQR3MHzaEqbGNq4U1Op/OQnfh
# dsWZ5/IfX3U4bv+ZNoOiyNRLSxNRwOQWFIfWTP9cyIsdcsNnnsPeZgsd3zATqTpQ
# JCiN0ynTxrr7MhYqkSLgPjMmhS6UHRJqxABwgb7+mWSfTmr/YAFIW+fSGsoQz4SD
# 4qXs+JCKDmEQ68Xid7MeuWi505WRZ1cr0IgMVfN90L6SEB4QXqYT8TJpnlUGaxPN
# GwuELS+kxOE7I/+WLDdRUgkRYoqMQKGCF5cwgheTBgorBgEEAYI3AwMBMYIXgzCC
# F38GCSqGSIb3DQEHAqCCF3AwghdsAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFSBgsq
# hkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCArZE4XtxXT+JpwqBzkv+HHobKmDxj1V+pEBZ20/8WG8gIGZZ/xIQN9
# GBMyMDI0MDEyNjAyMjcwMi44NzNaMASAAgH0oIHRpIHOMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046OEQwMC0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wg
# ghHtMIIHIDCCBQigAwIBAgITMwAAAc1VByrnysGZHQABAAABzTANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMzA1MjUxOTEy
# MDVaFw0yNDAyMDExOTEyMDVaMIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25z
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046OEQwMC0wNUUwLUQ5NDcxJTAjBgNV
# BAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQDTOCLVS2jmEWOqxzygW7s6YLmm29pjvA+Ch6VL7HlT
# L8yUt3Z0KIzTa2O/Hvr/aJza1qEVklq7NPiOrpBAIz657LVxwEc4BxJiv6B68a8D
# QiF6WAFFNaK3WHi7TfxRnqLohgNz7vZPylZQX795r8MQvX56uwjj/R4hXnR7Na4L
# lu4mWsml/wp6VJqCuxZnu9jX4qaUxngcrfFT7+zvlXClwLah2n0eGKna1dOjOgyK
# 00jYq5vtzr5NZ+qVxqaw9DmEsj9vfqYkfQZry2JO5wmgXX79Ox7PLMUfqT4+8w5J
# kdSMoX32b1D6cDKWRUv5qjiYh4o/a9ehE/KAkUWlSPbbDR/aGnPJLAGPy2qA97YC
# BeeIJjRKURgdPlhE5O46kOju8nYJnIvxbuC2Qp2jxwc6rD9M6Pvc8sZIcQ10YKZV
# YKs94YPSlkhwXwttbRY+jZnQiDm2ZFjH8SPe1I6ERcfeYX1zCYjEzdwWcm+fFZml
# JA9HQW7ZJAmOECONtfK28EREEE5yzq+T3QMVPhiEfEhgcYsh0DeoWiYGsDiKEuS+
# FElMMyT456+U2ZRa2hbRQ97QcbvaAd6OVQLp3TQqNEu0es5Zq0wg2CADf+QKQR/Y
# 6+fGgk9qJNJW3Mu771KthuPlNfKss0B1zh0xa1yN4qC3zoE9Uq6T8r7G3/OtSFms
# 4wIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFKGT+aY2aZrBAJVIZh5kicokfNWaMB8G
# A1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCG
# Tmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUy
# MFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4w
# XAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2Vy
# dHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwG
# A1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQD
# AgeAMA0GCSqGSIb3DQEBCwUAA4ICAQBSqG3ppKIU+i/EMwwtotoxnKfw0SX/3T16
# EPbjwsAImWOZ5nLAbatopl8zFY841gb5eiL1j81h4DiEiXt+BJgHIA2LIhKhSscd
# 79oMbr631DiEqf9X5LZR3V3KIYstU3K7f5Dk7tbobuHu+6fYM/gOx44sgRU7YQ+Y
# TYHvv8k4mMnuiahJRlU/F2vavcHU5uhXi078K4nSRAPnWyX7gVi6iVMBBUF4823o
# PFznEcHup7VNGRtGe1xvnlMd1CuyxctM8d/oqyTsxwlJAM5F/lDxnEWoSzAkad1n
# WvkaAeMV7+39IpXhuf9G3xbffKiyBnj3cQeiA4SxSwCdnx00RBlXS6r9tGDa/o9R
# S01FOABzKkP5CBDpm4wpKdIU74KtBH2sE5QYYn7liYWZr2f/U+ghTmdOEOPkXEcX
# 81H4dRJU28Tj/gUZdwL81xah8Kn+cB7vM/Hs3/J8tF13ZPP+8NtX3vu4NrchHDJY
# gjOi+1JuSf+4jpF/pEEPXp9AusizmSmkBK4iVT7NwVtRnS1ts8qAGHGPg2HPa4b2
# u9meueUoqNVtMhbumI1y+d9ZkThNXBXz2aItT2C99DM3T3qYqAUmvKUryVSpMLVp
# se4je5WN6VVlCDFKWFRH202YxEVWsZ5baN9CaqCbCS0Ea7s9OFLaEM5fNn9m5s69
# lD/ekcW2qTCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZI
# hvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
# DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24x
# MjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eSAy
# MDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
# AQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg4r25Phdg
# M/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aORmsHFPPF
# dvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41JmTamDu6
# GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5LFGc6XBp
# Dco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL64NF50Zu
# yjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9QZpGdc3E
# XzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj0XOmTTd0
# lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqEUUbi0b1q
# GFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0kZSU2LlQ
# +QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435UsSFF5PA
# PBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB3TCCAdkw
# EgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTEmr6CkTxG
# NSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwGA1UdIARV
# MFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNVHSUEDDAK
# BggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMC
# AYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvX
# zpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20v
# cGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYI
# KwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDANBgkqhkiG
# 9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4sQaTlz0x
# M7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th542DYunKmC
# VgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRXud2f8449
# xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBewVIVCs/wM
# nosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0DLzskYDS
# PeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+CljdQDzHVG2d
# Y3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFrDZ+kKNxn
# GSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFhbHP+Crvs
# QWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7ntdAoGokL
# jzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+oDEzfbzL
# 6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6FwZvKhggNQ
# MIICOAIBATCB+aGB0aSBzjCByzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEn
# MCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjhEMDAtMDVFMC1EOTQ3MSUwIwYDVQQD
# ExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQBo
# qfem2KKzuRZjISYifGolVOdyBKCBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6V2M+DAiGA8yMDI0MDEyNjAxNDQy
# NFoYDzIwMjQwMTI3MDE0NDI0WjB3MD0GCisGAQQBhFkKBAExLzAtMAoCBQDpXYz4
# AgEAMAoCAQACAgH7AgH/MAcCAQACAhOLMAoCBQDpXt54AgEAMDYGCisGAQQBhFkK
# BAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJ
# KoZIhvcNAQELBQADggEBAG3/zCPXpYvkFSXT55Ufj1hU0SUgNPRBwFfWmak0mZB/
# lMo7NuFf5KW+PUYdUGdENZdLALxURj7O2SuuIWcBtq/Ewky24sqpQ8EW+JXvj4Z2
# ulG68QqGvlEmlj8TzU20w+BurqprdIdJmVzhxy4SMuZ7ZXa/eCE4KPoLurSoEvJ0
# 5leeE/Eu7Z/xTeqlZB6f9H/v9R3jEAV5U1/Sib2VJZ3RxkVRMyyY01nQEkqb9JUA
# AWUkQ9on61T9DEmKEcRO8xM9tRH956ZB6Ls4VC5srGkWX1vh/gPI4n0jSFHghqfD
# BaFNf8MSU8SzMZzu+urZa3E/26fVfWVGgU60zCD5ma8xggQNMIIECQIBATCBkzB8
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1N
# aWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAc1VByrnysGZHQABAAAB
# zTANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEE
# MC8GCSqGSIb3DQEJBDEiBCDerkv9A1QQAJ2kyKTXwKDPtwVdctUlVqzCbr6k07L3
# ZDCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIOJmpfitVr1PZGgvTEdTpStU
# c6GNh7LNroQBKwpURpkKMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAHNVQcq58rBmR0AAQAAAc0wIgQg58OtYvhopOJPc3IQ2w06jzNe
# m0mW31I1HKat5p2/l/MwDQYJKoZIhvcNAQELBQAEggIAWvLjNNRArMhJB4rMcx+f
# yGzq0Gk0zU1sXUHENxFvEpWeloBT+mRtily+shfRcb1/wPIobzfBHty521gWoN5P
# vAX20SKy09N5ZDoq2oGuv/KXdDwUrc5zg6A6YrSxFPQvdfbBApZ4rkDT83WPAKGy
# lYvs2KqIusTcCZV4Y+tLKoFG72Pf6tIayqeo13AbBsKUxWGHfkwydLiJKJOsGCnQ
# gSnyNdhPrG5/Uvt0v4GExVY+SNBZ3iY1QxqiXU4KB84Ohcj8H5OxLkkXRf3wuuDm
# or71Xkxw2vy90MM35ZWsUQFHFlgstiyid6w2Tf71YSDlDbyjyMVdS2cw85vF5+uR
# G200BgDRcm5PaSCZrcWKK73X71OXXMlDvAnX4wnjAredkPbEfeJP02LBeOzUN5Jn
# OihKfxLIa9IKhpV/nF1CXIRvPSyeWYe6oWTtRPXNmm/fcbwqKGy1bRPC11aAG5U2
# byDm0PfDvwUYFHQ29dqnKix0YMun7MLWkc+ldQVM7mwI4I0P7+UoJzwWtR8v5AP1
# 7YWMfckrXyABZqo2yE5yaPKrzcd4YT2NzZyx3+oy6DZqa9+7mHlvgvrD16yhQlX8
# z8JEVDRNk4O1HGOLqqwQyyZX/RtR7SSxGkS8eaReHn9tBR25KSAzq2FbgqahTKzL
# ZfuVtHFVDXR7IASt9CQV0Zg=
# SIG # End signature block
