# ====================================================================== #
# UTF-8 with BOM Encoding for output
# ====================================================================== #

if ($PSVersionTable.PSVersion.Major -eq 5) {
    $OutputEncoding = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    [Console]::InputEncoding = [System.Text.Encoding]::UTF8
} else {
    $utf8WithBom = New-Object System.Text.UTF8Encoding $true
    $OutputEncoding = $utf8WithBom
    [Console]::OutputEncoding = $utf8WithBom
}

# ====================================================================== #
#  Script Metadata
# ====================================================================== #

$Script:WinfigMeta = @{
    Author       = "Armoghan-ul-Mohmin"
    CompanyName  = "Get-Winfig"
    Description  = "Windows configuration and automation framework"
    Version     = "1.0.0"
    License     = "MIT"
    Platform    = "Windows"
    PowerShell  = $PSVersionTable.PSVersion.ToString()
}

# ====================================================================== #
#  Color Palette
# ====================================================================== #

$Script:WinfigColors = @{
    Primary   = "Blue"
    Success   = "Green"
    Info      = "Cyan"
    Warning   = "Yellow"
    Error     = "Red"
    Accent    = "Magenta"
    Light     = "White"
    Dark      = "DarkGray"
}

# ====================================================================== #
# User Prompts
# ====================================================================== #

$Script:WinfigPrompts = @{
    Confirm    = "[?] Do you want to proceed? (Y/N): "
    Retry      = "[?] Do you want to retry? (Y/N): "
    Abort      = "[!] Operation aborted by user."
    Continue   = "[*] Press any key to continue..."
}

# ====================================================================== #
#  Paths
# ====================================================================== #

$Global:WinfigPaths = @{
    Desktop         = [Environment]::GetFolderPath("Desktop")
    Documents       = [Environment]::GetFolderPath("MyDocuments")
    UserProfile     = [Environment]::GetFolderPath("UserProfile")
    Temp            = [Environment]::GetEnvironmentVariable("TEMP")
    AppDataRoaming  = [Environment]::GetFolderPath("ApplicationData")
    AppDataLocal    = [Environment]::GetFolderPath("LocalApplicationData")
    Downloads       = [System.IO.Path]::Combine([Environment]::GetFolderPath("UserProfile"), "Downloads")
    Logs            = [System.IO.Path]::Combine([Environment]::GetEnvironmentVariable("TEMP"), "Winfig-Logs")
}
$Global:WinfigPaths.DotFiles = [System.IO.Path]::Combine($Global:WinfigPaths.UserProfile, ".Dotfiles")
$Global:WinfigPaths.Templates = [System.IO.Path]::Combine($Global:WinfigPaths.DotFiles, "winfig-code")

# ====================================================================== #
#  Extension List
# ====================================================================== #
$Script:Extensions = @(
    # Must Install No User Permission Needed
    @{ ID = "Catppuccin.catppuccin-vsc"; Name = "Catppuccin Theme"; Description = "A soothing pastel theme for VSCode"; permission = "true" }
    @{ ID = "miguelsolorio.fluent-icons"; Name = "Fluent Icons"; Description = "A set of fluent icons for VSCode"; permission = "true" }
    @{ ID = "vscode-icons-team.vscode-icons"; Name = "VSCode Icons"; Description = "A set of icons for VSCode"; permission = "true" }
    @{ ID = "BrandonKirbyson.vscode-animations"; Name = "VsCode Animations"; Description = "Beautiful animations for VSCode"; permission = "true" }
    @{ ID = "be5invis.vscode-custom-css"; Name = "Custom CSS and JS Loader"; Description = "Allows loading custom CSS and JS in VSCode"; permission = "true" }

    # Optional, required user Permission
    @{ ID = "tal7aouy.rainbow-bracket"; Name = "Rainbow Brackets"; Description = "Colorizes matching brackets with the same color.";  permission = "false" }
    @{ ID = "eamodio.gitlens"; Name = "GitLens — Git supercharged"; Description = "Supercharge the Git capabilities built into Visual Studio.";  permission = "false" }
    @{ ID = "github.codespaces"; Name = "Codespaces"; Description = "Develop in a container, on a remote machine, or in the cloud.";  permission = "false" }
    @{ ID = "github.copilot"; Name = "GitHub Copilot"; Description = "Your AI pair programmer.";  permission = "false" }
    @{ ID = "github.copilot-chat"; Name = "GitHub Copilot Chat"; Description = "Your AI assistant in VS Code.";  permission = "false" }
    @{ ID = "piotrpalarz.vscode-gitignore-generator"; Name = "Gitignore Generator"; Description = "Generate .gitignore files for your projects.";  permission = "false" }
    @{ ID = "GitHub.vscode-pull-request-github"; Name = "GitHub Pull Requests and Issues"; Description = "Manage GitHub PRs and Issues directly in VS Code.";  permission = "false" }
    @{ ID = "christian-kohler.npm-intellisense"; Name = "NPM Intellisense"; Description = "Autocompletes npm modules in import statements.";  permission = "false" }
    @{ ID = "formulahendry.code-runner"; Name = "Code Runner"; Description = "Run code snippet or code file for multiple languages.";  permission = "false" }
    @{ ID = "kamikillerto.vscode-colorize"; Name = "Colorize"; Description = "A VS Code extension that colorizes CSS colors in your editor.";  permission = "false" }
    @{ ID = "bmewburn.vscode-intelephense-client"; Name = "Intelephense"; Description = "PHP code intelligence for Visual Studio Code.";  permission = "false" }
    @{ ID = "devsense.phptools-vscode"; Name = "PHP Tools for Visual Studio Code"; Description = "Professional PHP development environment for Visual Studio Code.";  permission = "false" }
    @{ ID = "xdebug.php-debug"; Name = "PHP Debug"; Description = "Debug PHP with Xdebug.";  permission = "false" }
    @{ ID = "neilbrayfield.php-docblocker"; Name = "PHP DocBlocker"; Description = "Generate PHPDoc blocks for your functions and methods.";  permission = "false" }
    @{ ID = "dbaeumer.vscode-eslint"; Name = "ESLint"; Description = "Integrates ESLint JavaScript into VS Code.";  permission = "false" }
    @{ ID = "stylelint.vscode-stylelint"; Name = "Stylelint"; Description = "Modern CSS linter";  permission = "false" }
    @{ ID = "charliermarsh.ruff"; Name = "Ruff"; Description = "An extremely fast Python linter, written in Rust.";  permission = "false" }
    @{ ID = "ms-python.black-formatter"; Name = "Python Black Formatter"; Description = "Code formatter using 'Black'.";  permission = "false" }
    @{ ID = "ms-python.isort"; Name = "Python isort"; Description = "Sort Python imports using isort.";  permission = "false" }
    @{ ID = "esbenp.prettier-vscode"; Name = "Prettier - Code formatter"; Description = "Code formatter using prettier.";  permission = "false" }
    @{ ID = "foxundermoon.shell-format"; Name = "Shell Format"; Description = "A shell script formatter for VS Code.";  permission = "false" }
    @{ ID = "davidanson.vscode-markdownlint"; Name = "Markdownlint"; Description = "Markdown linting and style checking for Visual Studio Code.";  permission = "false" }
    @{ ID = "shd101wyy.markdown-preview-enhanced"; Name = "Markdown Preview Enhanced"; Description = "Markdown Preview Enhanced for VS Code.";  permission = "false" }
    @{ ID = "yzhang.markdown-all-in-one"; Name = "Markdown All in One"; Description = "All you need to write Markdown (keyboard shortcuts, table of contents, auto preview and more).";  permission = "false" }
    @{ ID = "tomoki1207.pdf"; Name = "vscode-pdf"; Description = "PDF viewer for Visual Studio Code.";  permission = "false" }
    @{ ID = "vkrsi.code-screenshot"; Name = "Code Screenshot"; Description = "Take screenshots of your code in VS Code.";  permission = "false" }
    @{ ID = "bierner.markdown-mermaid"; Name = "Markdown Mermaid Preview"; Description = "Preview mermaid diagrams in markdown files.";  permission = "false" }
    @{ ID = "grapecity.gc-excelviewer"; Name = "Excel Viewer"; Description = "View Excel spreadsheets directly in VS Code.";  permission = "false" }
    @{ ID = "shahilkumar.docxreader"; Name = "Docx Reader"; Description = "View .docx files directly in VS Code.";  permission = "false" }
    @{ ID = "bierner.emojisense"; Name = "Emojisense"; Description = "Autocomplete emoji names.";  permission = "false" }
    @{ ID = "gruntfuggly.todo-tree"; Name = "Todo Tree"; Description = "View your TODOs, FIXMEs, and any other annotations within a tree view.";  permission = "false" }
    @{ ID = "mechatroner.rainbow-csv"; Name = "Rainbow CSV"; Description = "Highlight CSV and TSV files and run simple SQL queries on them.";  permission = "false" }
    @{ ID = "oderwat.indent-rainbow"; Name = "Indent-Rainbow"; Description = "Makes indentation easier to read by colorizing the indentations.";  permission = "false" }
    @{ ID = "usernamehw.errorlens"; Name = "Error Lens"; Description = "Enhance highlighting of errors, warnings, and other language diagnostics.";  permission = "false" }
    @{ ID = "wix.vscode-import-cost"; Name = "Import Cost"; Description = "Display import/require package size in the editor.";  permission = "false" }
    @{ ID = "ms-toolsai.jupyter"; Name = "Jupyter"; Description = "Jupyter notebook support.";  permission = "false" }
    @{ ID = "ms-vscode-remote.remote-containers"; Name = "Remote - Containers"; Description = "Develop inside a container.";  permission = "false" }
    @{ ID = "bradlc.vscode-tailwindcss"; Name = "Tailwind CSS IntelliSense"; Description = "Intelligent Tailwind CSS tooling for VS Code.";  permission = "false" }
    @{ ID = "pranaygp.vscode-css-peek"; Name = "CSS Peek"; Description = "Peek to css ID and class strings as definitions from html files to respective CSS.";  permission = "false" }
    @{ ID = "ecmel.vscode-html-css"; Name = "HTML CSS Support"; Description = "CSS class name completion for the HTML class attribute.";  permission = "false" }
    @{ ID = "ritwickdey.liveserver"; Name = "Live Server"; Description = "Launch a development local Server with live reload feature for static & dynamic pages.";  permission = "false" }
    @{ ID = "formulahendry.auto-rename-tag"; Name = "Auto Rename Tag"; Description = "Automatically rename paired HTML/XML tags.";  permission = "false" }
    @{ ID = "xabikos.javascriptsnippets"; Name = "JavaScript (ES6) code snippets"; Description = "Code snippets for JavaScript in ES6 syntax.";  permission = "false" }
    @{ ID = "ms-python.python"; Name = "Python"; Description = "IntelliSense (Pylance), Linting, Debugging, Jupyter Notebooks, and more.";  permission = "false" }
    @{ ID = "ms-python.vscode-pylance"; Name = "Pylance"; Description = "A performant, feature-rich language server for Python in VS Code.";  permission = "false" }
    @{ ID = "kevinrose.vsc-python-indent"; Name = "Python Indent"; Description = "Improves Python indentation in VS Code.";  permission = "false" }
    @{ ID = "ms-vscode.cpptools"; Name = "C/C++"; Description = "C/C++ IntelliSense, debugging, and code browsing.";  permission = "false" }
    @{ ID = "ms-vscode.makefile-tools"; Name = "Makefile Tools"; Description = "Support for Makefile projects in VS Code.";  permission = "false" }
    @{ ID = "twxs.cmake"; Name = "CMake"; Description = "CMake language support for Visual Studio Code.";  permission = "false" }
    @{ ID = "ms-vscode.cmake-tools"; Name = "CMake Tools"; Description = "CMake integration for Visual Studio Code.";  permission = "false" }
    @{ ID = "ms-vscode.cpptools-extension-pack"; Name = "C/C++ Extension Pack"; Description = "A collection of extensions for C/C++ development.";  permission = "false" }
    @{ ID = "golang.go"; Name = "Go"; Description = "Rich Go language support for Visual Studio Code.";  permission = "false" }
    @{ ID = "visualstudioexptteam.vscodeintellicode"; Name = "Visual Studio IntelliCode"; Description = "AI-assisted development for Visual Studio Code.";  permission = "false" }
    @{ ID = "budparr.language-hugo-vscode"; Name = "Hugo Language and Syntax Support"; Description = "Provides language and syntax support for Hugo static site generator.";  permission = "false" }
    @{ ID = "redhat.vscode-yaml"; Name = "YAML"; Description = "YAML Language Support by Red Hat.";  permission = "false" }
    @{ ID = "esbenp.prettier-vscode"; Name = "Prettier - Code formatter"; Description = "Code formatter using prettier.";  permission = "false" }
    @{ ID = "DotJoshJohnson.xml"; Name = "XML Tools"; Description = "XML Tools for Visual Studio Code.";  permission = "false" }
    @{ ID = "ZainChen.json"; Name = "JSON Tools"; Description = "JSON Tools for Visual Studio Code.";  permission = "false" }
    @{ ID = "be5invis.toml" ; Name = "TOML"; Description = "TOML language support for Visual Studio Code.";  permission = "false" }
)

# ====================================================================== #
# Start Time, Resets, Counters
# ====================================================================== #
$Global:WinfigLogStart = Get-Date
$Global:WinfigLogFilePath = $null
Remove-Variable -Name WinfigLogFilePath -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name LogCount -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name ErrorCount -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name WarnCount -Scope Global -ErrorAction SilentlyContinue

# ====================================================================== #
# Utility Functions
# ====================================================================== #

# ---------------------------------------------------------------------------- #
# Function to display a Success message
function Show-SuccessMessage {
    param (
        [string]$Message
    )
    Write-Host "[OK] $Message" -ForegroundColor $Script:WinfigColors.Success
}

# ---------------------------------------------------------------------------- #
# Function to display an Error message
function Show-ErrorMessage {
    param (
        [string]$Message
    )
    Write-Host "[ERROR] $Message" -ForegroundColor $Script:WinfigColors.Error
}

# ---------------------------------------------------------------------------- #
# Function to display an Info message
function Show-InfoMessage {
    param (
        [string]$Message
    )
    Write-Host "[INFO] $Message" -ForegroundColor $Script:WinfigColors.Info
}

# ---------------------------------------------------------------------------- #
# Function to display a Warning message
function Show-WarningMessage {
    param (
        [string]$Message
    )
    Write-Host "[WARN] $Message" -ForegroundColor $Script:WinfigColors.Warning
}

# ---------------------------------------------------------------------------- #
# Function to prompt user for input with a specific color
function Prompt-UserInput {
    param (
        [string]$PromptMessage = $Script:WinfigPrompts.Confirm,
        [string]$PromptColor   = $Script:WinfigColors.Primary
    )
    # Write prompt in the requested color, keep cursor on same line, then read input
    Write-Host -NoNewline $PromptMessage -ForegroundColor $PromptColor
    $response = Read-Host

    return $response
}

# ---------------------------------------------------------------------------- #
# Function to Prompt user for confirmation (Y/N)
function Prompt-UserConfirmation {
    while ($true) {
        $response = Prompt-UserInput -PromptMessage $Script:WinfigPrompts.Confirm -PromptColor $Script:WinfigColors.Primary
        switch ($response.ToUpper()) {
            "Y" { return $true }
            "N" { return $false }
            default {
                Show-WarningMessage "Invalid input. Please enter Y or N."
            }
        }
    }
}

# ---------------------------------------------------------------------------- #
# Function to Prompt user to Retry (Y/N)
function Prompt-UserRetry {
    while ($true) {
        $response = Prompt-UserInput -PromptMessage $Script:WinfigPrompts.Retry -PromptColor $Script:WinfigColors.Primary
        switch ($response.ToUpper()) {
            "Y" { return $true }
            "N" { return $false }
            default {
                Show-WarningMessage "Invalid input. Please enter Y or N."
            }
        }
    }
}

# ---------------------------------------------------------------------------- #
# Function to Prompt user to continue
function Prompt-UserContinue {
    Write-Host $Script:WinfigPrompts.Continue -ForegroundColor $Script:WinfigColors.Primary
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# ---------------------------------------------------------------------------- #
# Function to Abort operation
function Abort-Operation {
    Show-ErrorMessage $Script:WinfigPrompts.Abort
    # Write log footer before exiting
    if ($Global:WinfigLogFilePath) {
        Log-Message -Message "Script terminated." -EndRun
    }
    exit 1
}

# ---------------------------------------------------------------------------- #
# Function to Write a Section Header
function Write-SectionHeader {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Title,

        [Parameter(Mandatory=$false)]
        [string]$Description = ""
    )
    $separator = "=" * 70
    Write-Host $separator -ForegroundColor $Script:WinfigColors.Accent
    Write-Host "$Title" -ForegroundColor $Script:WinfigColors.Primary
    if ($Description) {
        Write-Host "$Description" -ForegroundColor $Script:WinfigColors.Accent
    }
    Write-Host $separator -ForegroundColor $Script:WinfigColors.Accent
}

# ---------------------------------------------------------------------------- #
# Function to Write a Subsection Header
function Write-SubsectionHeader {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Title
    )
    $separator = "-" * 50
    Write-Host $separator -ForegroundColor $Script:WinfigColors.Accent
    Write-Host "$Title" -ForegroundColor $Script:WinfigColors.Primary
    Write-Host $separator -ForegroundColor $Script:WinfigColors.Accent
}

# ---------------------------------------------------------------------------- #
#  Function to Write a Log Message
function Log-Message {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Message,

        [Parameter(Mandatory=$false)]
        [ValidateSet("DEBUG", "INFO", "WARN", "ERROR", "SUCCESS")]
        [string]$Level = "INFO",

        [Parameter(Mandatory=$false)]
        [switch]$EndRun
    )

    if (-not $Global:LogCount) { $Global:LogCount = 0 }
    if (-not $Global:ErrorCount) { $Global:ErrorCount = 0 }
    if (-not $Global:WarnCount) { $Global:WarnCount = 0 }


    if (-not (Test-Path -Path $Global:WinfigPaths.Logs)) {
        New-Item -ItemType Directory -Path $Global:WinfigPaths.Logs -Force | Out-Null
    }

    $enc = New-Object System.Text.UTF8Encoding $true

    $identity = try { [System.Security.Principal.WindowsIdentity]::GetCurrent().Name } catch { $env:USERNAME }
    $isElevated = try {
        (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    } catch {
        $false
    }
    $scriptPath = if ($PSCommandPath) { $PSCommandPath } elseif ($MyInvocation.MyCommand.Path) { $MyInvocation.MyCommand.Path } else { $null }
    $psVersion = $PSVersionTable.PSVersion.ToString()
    $dotNetVersion = [System.Environment]::Version.ToString()
    $workingDir = (Get-Location).Path
    $osInfo = try {
        (Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop).Caption
    } catch {
        [Environment]::OSVersion.VersionString
    }
    # ---------------------------------------------------------------------------------------

    if (-not $Global:WinfigLogFilePath) {
        # $Global:WinfigLogStart is set in the main script execution block for each run
        $fileStamp = $Global:WinfigLogStart.ToString('yyyy-MM-dd_HH-mm-ss')
        $Global:WinfigLogFilePath = [System.IO.Path]::Combine($Global:WinfigPaths.Logs, "winfig-VsCode-$fileStamp.log")

        $header = @()
        $header += "==================== Winfig VsCode Log ===================="
        $header += "Start Time  : $($Global:WinfigLogStart.ToString('yyyy-MM-dd HH:mm:ss'))"
        $header += "Host Name   : $env:COMPUTERNAME"
        $header += "User        : $identity"
        $header += "IsElevated  : $isElevated"
        if ($scriptPath) { $header += "Script Path : $scriptPath" }
        $header += "Working Dir : $workingDir"
        $header += "PowerShell  : $psVersion"
        $header += "NET Version : $dotNetVersion"
        $header += "OS          : $osInfo"
        $header += "=============================================================="
        $header += ""

        try {
            [System.IO.File]::WriteAllLines($Global:WinfigLogFilePath, $header, $enc)
        } catch {
            $header | Out-File -FilePath $Global:WinfigLogFilePath -Encoding UTF8 -Force
        }
    } else {
        if (-not $Global:WinfigLogStart) {
            $Global:WinfigLogStart = Get-Date
        }

        try {
            if (Test-Path -Path $Global:WinfigLogFilePath) {
                $firstLine = Get-Content -Path $Global:WinfigLogFilePath -TotalCount 1 -ErrorAction SilentlyContinue
                if ($firstLine -and ($firstLine -notmatch 'Winfig VsCode Log')) {

                    $header = @()
                    $header += "==================== Winfig VsCode Log  ===================="
                    $header += "Start Time  : $($Global:WinfigLogStart.ToString('yyyy-MM-dd HH:mm:ss'))"
                    $header += "Host Name   : $env:COMPUTERNAME"
                    $header += "User        : $identity"
                    $header += "IsElevated  : $isElevated"
                    if ($scriptPath) { $header += "Script Path : $scriptPath" }
                    $header += "Working Dir : $workingDir"
                    $header += "PowerShell  : $psVersion"
                    $header += "NET Version : $dotNetVersion"
                    $header += "OS          : $osInfo"
                    $header += "======================================================================="
                    $header += ""

                    # Prepend header safely: write header to temp file then append original content
                    $temp = [System.IO.Path]::GetTempFileName()
                    try {
                        [System.IO.File]::WriteAllLines($temp, $header, $enc)
                        [System.IO.File]::AppendAllLines($temp, (Get-Content -Path $Global:WinfigLogFilePath -Raw).Split([Environment]::NewLine), $enc)
                        Move-Item -Force -Path $temp -Destination $Global:WinfigLogFilePath
                    } finally {
                        if (Test-Path $temp) { Remove-Item $temp -ErrorAction SilentlyContinue }
                    }
                }
            }
        } catch {
            # ignore header-fix failures; continue logging
        }
    }

    if ($EndRun) {
        $endTime = Get-Date
        # $Global:WinfigLogStart is guaranteed to be set now
        $duration = $endTime - $Global:WinfigLogStart
        $footer = @()
        $footer += ""
        $footer += "--------------------------------------------------------------"
        $footer += "End Time    : $($endTime.ToString('yyyy-MM-dd HH:mm:ss'))"
        $footer += "Duration    : $($duration.ToString('dd\.hh\:mm\:ss') -replace '^00\.', '')"
        $footer += "Log Count   : $Global:LogCount"
        $footer += "Errors/Warn : $Global:ErrorCount / $Global:WarnCount"
        $footer += "===================== End of Winfig Log ======================"
        try {
            [System.IO.File]::AppendAllLines($Global:WinfigLogFilePath, $footer, $enc)
        } catch {
            $footer | Out-File -FilePath $Global:WinfigLogFilePath -Append -Encoding UTF8
        }
        return
    }

    $now = Get-Date
    $timestamp = $now.ToString("yyyy-MM-dd HH:mm:ss.fff")
    $logEntry = "[$timestamp] [$Level] $Message"

    $Global:LogCount++
    if ($Level -eq 'ERROR') { $Global:ErrorCount++ }
    if ($Level -eq 'WARN') { $Global:WarnCount++ }

    try {
        [System.IO.File]::AppendAllText($Global:WinfigLogFilePath, $logEntry + [Environment]::NewLine, $enc)
    } catch {
        Write-Host "Failed to write log to file: $($_.Exception.Message)" -ForegroundColor Yellow
        Write-Host $logEntry
    }
}

# ====================================================================== #
#  Main Functions
# ====================================================================== #

# ---------------------------------------------------------------------------- #
# Function to check if running as Administrator
function IsAdmin{
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)
    if ($principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Log-Message -Message "Script is running with Administrator privileges." -Level "SUCCESS"
    } else {
        Show-ErrorMessage "Script is NOT running with Administrator privileges."
        Log-Message -Message "Script is NOT running with Administrator privileges." -Level "ERROR"
        Log-Message "Forced exit." -EndRun
        $LogPathMessage = "Check the Log file for details: $($Global:WinfigLogFilePath)"
        Show-InfoMessage -Message $LogPathMessage
        exit 1
    }
}

# ---------------------------------------------------------------------------- #
# Function to check Working Internet Connection
function Test-InternetConnection {
    try {
        $request = [System.Net.WebRequest]::Create("http://www.google.com")
        $request.Timeout = 5000
        $response = $request.GetResponse()
        $response.Close()
        Log-Message -Message "Internet connection is available." -Level "SUCCESS"
        return $true
    } catch {
        Show-ErrorMessage "No internet connection available: $($_.Exception.Message)"
        Log-Message -Message "No internet connection available: $($_.Exception.Message)" -Level "ERROR"
        Log-Message "Forced exit." -EndRun
        $LogPathMessage = "Check the Log file for details: $($Global:WinfigLogFilePath)"
        Show-InfoMessage -Message $LogPathMessage
        exit 1

    }
}

# ---------------------------------------------------------------------------- #
# Function to check if PowerShell version is 7 or higher
function Test-PSVersion {
    $psVersion = $PSVersionTable.PSVersion
    if ($psVersion.Major -ge 5) {
        Log-Message -Message "PowerShell version is sufficient: $($psVersion.ToString())." -Level "SUCCESS"
    } else {
        Show-ErrorMessage "PowerShell version is insufficient: $($psVersion.ToString()). Version 5 or higher is required."
        Log-Message -Message "PowerShell version is insufficient: $($psVersion.ToString()). Version 5 or higher is required." -Level "ERROR"
        Log-Message "Forced exit." -EndRun
        $LogPathMessage = "Check the Log file for details: $($Global:WinfigLogFilePath)"
        Show-InfoMessage -Message $LogPathMessage
        exit 1
    }
}

# ---------------------------------------------------------------------------- #
# Function to Display Banner
function Winfig-Banner {
    Clear-Host
    Write-Host ""
    Write-Host ("  ██╗    ██╗██╗███╗   ██╗███████╗██╗ ██████╗  ".PadRight(70)) -ForegroundColor $Script:WinfigColors.Light
    Write-Host ("  ██║    ██║██║████╗  ██║██╔════╝██║██╔════╝  ".PadRight(70)) -ForegroundColor $Script:WinfigColors.Light
    Write-Host ("  ██║ █╗ ██║██║██╔██╗ ██║█████╗  ██║██║  ███╗ ".PadRight(70)) -ForegroundColor $Script:WinfigColors.Accent
    Write-Host ("  ██║███╗██║██║██║╚██╗██║██╔══╝  ██║██║   ██║ ".PadRight(70)) -ForegroundColor $Script:WinfigColors.Accent
    Write-Host ("  ╚███╔███╔╝██║██║ ╚████║██║     ██║╚██████╔╝ ".PadRight(70)) -ForegroundColor $Script:WinfigColors.Success
    Write-Host ("   ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝  ".PadRight(70)) -ForegroundColor $Script:WinfigColors.Success
    Write-Host ((" " * 70)) -ForegroundColor $Script:WinfigColors.Primary
    Write-Host ("" + $Script:WinfigMeta.CompanyName).PadLeft(40).PadRight(70) -ForegroundColor $Script:WinfigColors.Primary
    Write-Host ((" " * 70)) -ForegroundColor $Script:WinfigColors.Primary
    Write-Host ("  " + $Script:WinfigMeta.Description).PadRight(70) -ForegroundColor $Script:WinfigColors.Accent
    Write-Host ((" " * 70)) -ForegroundColor $Script:WinfigColors.Primary
    Write-Host (("  Version: " + $Script:WinfigMeta.Version + "    PowerShell: " + $Script:WinfigMeta.PowerShell).PadRight(70)) -ForegroundColor $Script:WinfigColors.Warning
    Write-Host (("  Author:  " + $Script:WinfigMeta.Author + "    Platform: " + $Script:WinfigMeta.Platform).PadRight(70)) -ForegroundColor $Script:WinfigColors.Warning
    Write-Host ""
}

# ---------------------------------------------------------------------------- #
# CTRL+C Signal Handler
trap {
    # Check if the error is due to a user interrupt (CTRL+C)
    if ($_.Exception.GetType().Name -eq "HostException" -and $_.Exception.Message -match "stopped by user") {

        # 1. Print the desired message
        Write-Host ""
        Write-Host ">>> [!] User interruption (CTRL+C) detected. Exiting gracefully..." -ForegroundColor $Script:WinfigColors.Accent

        # 2. Log the event before exit
        Log-Message -Message "Script interrupted by user (CTRL+C)." -Level "WARN"

        # 3. Write log footer before exiting
        if ($Global:WinfigLogFilePath) {
            Log-Message -Message "Script terminated by user (CTRL+C)." -EndRun
        }

        # 4. Terminate the script cleanly (exit code 1 is standard for non-zero exit)
        exit 1
    }
    # If it's a different kind of error, let the default behavior (or next trap) handle it
    continue
}

# ---------------------------------------------------------------------------- #
#  Create Dotfiles Directory if not exists
function Create-DotfilesDirectory {
    if (-not (Test-Path -Path $Global:WinfigPaths.DotFiles)) {
        try {
            New-Item -ItemType Directory -Path $Global:WinfigPaths.DotFiles -Force | Out-Null
            Show-SuccessMessage "Created Dotfiles directory at $($Global:WinfigPaths.DotFiles)."
            Log-Message -Message "Created Dotfiles directory at $($Global:WinfigPaths.DotFiles)." -Level "SUCCESS"
        } catch {
            Show-ErrorMessage "Failed to create Dotfiles directory: $($_.Exception.Message)"
            Log-Message -Message "Failed to create Dotfiles directory: $($_.Exception.Message)" -Level "ERROR"
            Abort-Operation
        }
    } else {
        Log-Message -Message "Dotfiles directory already exists at $($Global:WinfigPaths.DotFiles)." -Level "INFO"
    }
}

# ---------------------------------------------------------------------------- #
# Check if VsCode is installed
function Test-WindowsVsCodeInstalled {
    try {
        code --version *> $null
        Log-Message -Message "VsCode is installed." -Level "SUCCESS"
        return $true
    } catch {
        Show-ErrorMessage "VsCode is not installed or not found in PATH."
        Log-Message -Message "VsCode is not installed or not found in PATH." -Level "ERROR"
        exit 1
    }
}

# ---------------------------------------------------------------------------- #
#  Check if git is installed
function Test-GitInstalled {
    try {
        git --version *> $null
        Log-Message -Message "Git is installed." -Level "SUCCESS"
        return $true
    } catch {
        Show-ErrorMessage "Git is not installed or not found in PATH."
        Log-Message -Message "Git is not installed or not found in PATH." -Level "ERROR"
        exit 1
    }
}

# ---------------------------------------------------------------------------- #
#  Install VsCode Extensions
function Install-Extensions {
    param(
        [Parameter(Mandatory=$true)]
        [array]$ExtensionsList
    )

    $installCommand = "code --install-extension {0} --force"

    foreach ($extension in $ExtensionsList) {
        $extID = $extension.ID
        $extName = $extension.Name
        $extDesc = $extension.Description
        $permission = $extension.permission

        Write-SubsectionHeader -Title "Processing: $extName"
        Show-InfoMessage "$extDesc"
        Write-Host ""

        if ($permission -eq "true") {
            try {
                Show-InfoMessage "Installing $extName..."
                Log-Message -Message "Installing extension: $extName ($extID)..." -Level "INFO"
                $command = $installCommand -f $extID
                iex $command *> $null
                Show-SuccessMessage "$extName ($extID) installed successfully."
                Write-Host ""
                Log-Message -Message "Installed extension: $extName ($extID)." -Level "SUCCESS"
            } catch {
                Show-ErrorMessage "Failed to install $extName ($extID): $($_.Exception.Message)"
                Log-Message -Message "Failed to install extension: $extName ($extID): $($_.Exception.Message)" -Level "ERROR"
            }
        } else {
            $promptMsg = "[?] Install $extName ($extID)? (Y/N): "
            $userInput = Prompt-UserInput -PromptMessage $promptMsg -PromptColor $Script:WinfigColors.Primary
            if ($userInput.ToUpper() -eq "Y") {
                try {
                    Show-InfoMessage "Installing $extName ($extID)..."
                    Log-Message -Message "Installing extension: $extName ($extID)..." -Level "INFO"
                    $command = $installCommand -f $extID
                    iex $command *> $null
                    Show-SuccessMessage "$extName ($extID) installed successfully."
                    Write-Host ""
                    Log-Message -Message "Installed extension: $extName ($extID)." -Level "SUCCESS"
                } catch {
                    Show-ErrorMessage "Failed to install $extName ($extID): $($_.Exception.Message)"
                    Log-Message -Message "Failed to install extension: $extName ($extID): $($_.Exception.Message)" -Level "ERROR"
                }
            } else {
                Show-WarningMessage "Skipped extension: $extName ($extID)."
                Log-Message -Message "User skipped extension: $extName ($extID)." -Level "WARN"
            }
        }
    }
}

# ====================================================================== #
#  Main Script Execution
# ====================================================================== #

Winfig-Banner
Write-SectionHeader -Title "Checking Requirements"
Write-Host ""

IsAdmin | Out-Null
Show-SuccessMessage "Administrator privileges confirmed."

Test-InternetConnection | Out-Null
Show-SuccessMessage "Internet connection is available."

Test-PSVersion | Out-Null
Show-SuccessMessage "PowerShell version is sufficient."

Test-WindowsVsCodeInstalled | Out-Null
Show-SuccessMessage "Windows VsCode installation check completed."

Test-GitInstalled | Out-Null
Show-SuccessMessage "Git installation check completed."

Create-DotfilesDirectory | Out-Null
Show-SuccessMessage "Dotfiles directory setup completed."

Write-Host ""
Prompt-UserContinue

Winfig-Banner
Write-SectionHeader -Title "Cloning Winfig VsCode Repository"
Write-Host ""
$repoPath = Join-Path $Global:WinfigPaths.DotFiles "winfig-code"
if (-not (Test-Path -Path $repoPath)) {
    try {
        Show-InfoMessage "Cloning Winfig VsCode repository..."
        Log-Message -Message "Cloning Winfig VsCode repository..." -Level "INFO"
        git clone https://github.com/Get-Winfig/winfig-code.git $repoPath *> $null
    } catch {
        Show-ErrorMessage "Failed to clone Winfig VsCode repository: $($_.Exception.Message)"
        Log-Message -Message "Failed to clone Winfig VsCode repository: $($_.Exception.Message)" -Level "ERROR"
        exit 1
    }
    if (Test-Path -Path $repoPath) {
        Show-SuccessMessage "Cloned Winfig VsCode repository to $repoPath."
        Log-Message -Message "Cloned Winfig VsCode repository to $repoPath." -Level "SUCCESS"
    } else {
        Show-ErrorMessage "Winfig VsCode repository was not cloned. Please check your internet connection or repository URL."
        Log-Message -Message "Winfig VsCode repository was not cloned. Please check your internet connection or repository URL." -Level "ERROR"
        exit 1
    }
} else {
    try {
        Show-InfoMessage "Updating Winfig VsCode repository..."
        Log-Message -Message "Updating Winfig VsCode repository..." -Level "INFO"
        Push-Location $repoPath
        git pull *> $null
        Pop-Location
        Show-SuccessMessage "Updated Winfig VsCode repository at $repoPath."
        Log-Message -Message "Updated Winfig VsCode repository at $repoPath." -Level "SUCCESS"
    } catch {
        Show-ErrorMessage "Failed to update Winfig VsCode repository: $($_.Exception.Message)"
        Log-Message -Message "Failed to update Winfig VsCode repository: $($_.Exception.Message)" -Level "ERROR"
        exit 1
    }
}

Write-Host ""
Prompt-UserContinue

Winfig-Banner
Write-SectionHeader -Title "Installing VsCode Extensions"
Write-Host ""

Install-Extensions -ExtensionsList $Script:Extensions

Write-Host ""
Prompt-UserContinue

Winfig-Banner
Write-SectionHeader -Title "Symbolic Linking VsCode Configuration"
Write-Host ""
try {
    $settings =  [System.IO.Path]::Combine($Global:WinfigPaths.Templates, "settings.json")
    $tasks =  [System.IO.Path]::Combine($Global:WinfigPaths.Templates, "tasks.json")
    $extensions =  [System.IO.Path]::Combine($Global:WinfigPaths.Templates, "extensions.json")
    $keybindings =  [System.IO.Path]::Combine($Global:WinfigPaths.Templates, "keybindings.json")
    $target = [System.IO.Path]::Combine($Global:WinfigPaths.AppDataRoaming, "Code\User")

    $files = @{
        "settings.json"   = $settings
        "tasks.json"      = $tasks
        "extensions.json" = $extensions
        "keybindings.json"= $keybindings
    }

    foreach ($name in $files.Keys) {
        $src = $files[$name]
        $dst = Join-Path $target $name

        # Remove existing file or symlink if present
        if (Test-Path $dst) {
            Remove-Item $dst -Force
            Log-Message -Message "Removed existing $dst" -Level "INFO"
        }

        # Create symbolic link
        New-Item -ItemType SymbolicLink -Path $dst -Target $src -Force | Out-Null
        Show-SuccessMessage "Linked $name to $dst"
        Log-Message -Message "Created symlink: $dst -> $src" -Level "SUCCESS"
    }
} catch {
    Show-ErrorMessage "Failed to create symlink: $($_.Exception.Message)"
    Log-Message -Message "Failed to create symlink: $($_.Exception.Message)" -Level "ERROR"
}

Write-Host ""
Write-SectionHeader -Title "Thank You For Using Winfig VsCode" -Description "https://github.com/Get-Winfig/"
Show-WarningMessage -Message "Restart Windows to apply changes"
Write-Host ""
Log-Message -Message "Logging Completed." -EndRun
