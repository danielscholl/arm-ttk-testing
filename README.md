# ARM Template Testing POC

This project demonstrates a Proof of Concept (POC) for testing Azure Resource Manager (ARM) templates using the `arm-ttk` PowerShell module. It supports both local testing via Docker and automated testing through GitHub Actions.

## Getting Started

These instructions will help you set up the project for development and testing purposes.

### Prerequisites

- Docker installed on your machine (for local testing)
- GitHub repository with Actions enabled (for CI/CD)

### Local Testing

1. Navigate to the project root directory
2. Run the following command:

```bash
docker compose up --build
```

This will:
- Build a Docker image with the ARM TTK tools
- Mount your `src` directory containing ARM templates
- Run tests against all JSON files in the mounted directory

#### Example Output

```bash
arm-ttk-1  | Testing file: /workspace/templates/azuredeploy.json
arm-ttk-1  | 
arm-ttk-1  | Validating templates\azuredeploy.json
arm-ttk-1  |   JSONFiles Should Be Valid
arm-ttk-1  |     [+] JSONFiles Should Be Valid (10 ms)
arm-ttk-1  |   adminUsername Should Not Be A Literal
arm-ttk-1  |     [+] adminUsername Should Not Be A Literal (65 ms)
arm-ttk-1  |   apiVersions Should Be Recent In Reference Functions
arm-ttk-1  |     [+] apiVersions Should Be Recent In Reference Functions (9 ms)
arm-ttk-1  |   apiVersions Should Be Recent
arm-ttk-1  |     [+] apiVersions Should Be Recent (51 ms)
arm-ttk-1  |   artifacts parameter
arm-ttk-1  |     [+] artifacts parameter (3 ms)
arm-ttk-1  |   CommandToExecute Must Use ProtectedSettings For Secrets
arm-ttk-1  |     [+] CommandToExecute Must Use ProtectedSettings For Secrets (12 ms)
arm-ttk-1  |   DependsOn Best Practices
arm-ttk-1  |     [+] DependsOn Best Practices (9 ms)
arm-ttk-1  |   Deployment Resources Must Not Be Debug
arm-ttk-1  |     [+] Deployment Resources Must Not Be Debug (7 ms)
arm-ttk-1  |   DeploymentTemplate Must Not Contain Hardcoded Uri
arm-ttk-1  |     [+] DeploymentTemplate Must Not Contain Hardcoded Uri (25 ms)
arm-ttk-1  |   DeploymentTemplate Schema Is Correct
arm-ttk-1  |     [+] DeploymentTemplate Schema Is Correct (2 ms)
arm-ttk-1  |   Dynamic Variable References Should Not Use Concat
arm-ttk-1  |     [+] Dynamic Variable References Should Not Use Concat (3 ms)
arm-ttk-1  |   IDs Should Be Derived From ResourceIDs
arm-ttk-1  |     [+] IDs Should Be Derived From ResourceIDs (8 ms)
arm-ttk-1  |   Location Should Not Be Hardcoded
arm-ttk-1  |     [+] Location Should Not Be Hardcoded (49 ms)
arm-ttk-1  |   ManagedIdentityExtension must not be used
arm-ttk-1  |     [+] ManagedIdentityExtension must not be used (2 ms)
arm-ttk-1  |   Min And Max Value Are Numbers
arm-ttk-1  |     [+] Min And Max Value Are Numbers (3 ms)
arm-ttk-1  |   Outputs Must Not Contain Secrets
arm-ttk-1  |     [+] Outputs Must Not Contain Secrets (5 ms)
arm-ttk-1  |   Parameter Types Should Be Consistent
arm-ttk-1  |     [+] Parameter Types Should Be Consistent (19 ms)
arm-ttk-1  |   Parameters Must Be Referenced
arm-ttk-1  |     [+] Parameters Must Be Referenced (9 ms)
arm-ttk-1  |   Password params must be secure
arm-ttk-1  |     [+] Password params must be secure (9 ms)
arm-ttk-1  |   providers apiVersions Is Not Permitted
arm-ttk-1  |     [+] providers apiVersions Is Not Permitted (1 ms)
arm-ttk-1  |   ResourceIds should not contain
arm-ttk-1  |     [+] ResourceIds should not contain (20 ms)
arm-ttk-1  |   Resources Should Have Location
arm-ttk-1  |     [+] Resources Should Have Location (5 ms)
arm-ttk-1  |   Resources Should Not Be Ambiguous
arm-ttk-1  |     [+] Resources Should Not Be Ambiguous (6 ms)
arm-ttk-1  |   Secure Params In Nested Deployments
arm-ttk-1  |     [+] Secure Params In Nested Deployments (6 ms)
arm-ttk-1  |   Secure String Parameters Cannot Have Default
arm-ttk-1  |     [+] Secure String Parameters Cannot Have Default (3 ms)
arm-ttk-1  |   Template Should Not Contain Blanks
arm-ttk-1  |     [+] Template Should Not Contain Blanks (35 ms)
arm-ttk-1  |   URIs Should Be Properly Constructed
arm-ttk-1  |     [+] URIs Should Be Properly Constructed (11 ms)
arm-ttk-1  |   Variables Must Be Referenced
arm-ttk-1  |     [+] Variables Must Be Referenced (4 ms)
arm-ttk-1  |   Virtual Machines Should Not Be Preview
arm-ttk-1  |     [+] Virtual Machines Should Not Be Preview (11 ms)
arm-ttk-1  |   VM Images Should Use Latest Version
arm-ttk-1  |     [+] VM Images Should Use Latest Version (1 ms)
arm-ttk-1  |   VM Size Should Be A Parameter
arm-ttk-1  |     [+] VM Size Should Be A Parameter (10 ms)
arm-ttk-1  | Validating templates\azuredeploy.parameters.json
arm-ttk-1  |   DeploymentParameters Should Have ContentVersion
arm-ttk-1  |     [+] DeploymentParameters Should Have ContentVersion (4 ms)
arm-ttk-1  |   DeploymentParameters Should Have Parameters
arm-ttk-1  |     [+] DeploymentParameters Should Have Parameters (1 ms)
arm-ttk-1  |   DeploymentParameters Should Have Schema
arm-ttk-1  |     [+] DeploymentParameters Should Have Schema (7 ms)
arm-ttk-1  |   DeploymentParameters Should Have Value
arm-ttk-1  |     [+] DeploymentParameters Should Have Value (10 ms)
arm-ttk-1  | Fail  : 0
arm-ttk-1  | Total : 35
arm-ttk-1  | Pass  : 35
arm-ttk-1  | 
arm-ttk-1  | 
arm-ttk-1  | Testing file: /workspace/templates/azuredeploy.parameters.json
arm-ttk-1  |   JSONFiles Should Be Valid
arm-ttk-1  |     [+] JSONFiles Should Be Valid (3 ms)
arm-ttk-1  | Fail  : 0
arm-ttk-1  | Total : 1
arm-ttk-1  | Pass  : 1
arm-ttk-1  | 
arm-ttk-1  | 
arm-ttk-1  |   DeploymentParameters Should Have ContentVersion
arm-ttk-1  |     [+] DeploymentParameters Should Have ContentVersion (1 ms)
arm-ttk-1  |   DeploymentParameters Should Have Parameters
arm-ttk-1  |     [+] DeploymentParameters Should Have Parameters (0 ms)
arm-ttk-1  |   DeploymentParameters Should Have Schema
arm-ttk-1  |     [+] DeploymentParameters Should Have Schema (1 ms)
arm-ttk-1  |   DeploymentParameters Should Have Value
arm-ttk-1  |     [+] DeploymentParameters Should Have Value (1 ms)
arm-ttk-1  | Fail  : 0
arm-ttk-1  | Total : 5
arm-ttk-1  | Pass  : 5
arm-ttk-1  | 
arm-ttk-1  | 
arm-ttk-1  | Infra tests failed. Exiting with status 1.
arm-ttk-1 exited with code 1
```

### GitHub Actions Setup

The project includes automated testing via GitHub Actions. The workflow:
- Triggers on pull requests targeting main branch
- Tests all ARM templates in the `src` directory
- Provides inline PR comments for any issues found

To enable:
1. Ensure your repository has Actions enabled
2. The workflow file is already configured at `.github/workflows/arm-ttk.yml`
3. No additional setup required - it will run automatically on PRs

### Project Structure

```
.
├── src/                    # ARM templates
├── tests/                  # Test scripts
├── Dockerfile             # Container definition
├── docker-compose.yml     # Local test configuration
└── .github/workflows/     # GitHub Actions definitions
```

## Testing Details

### Local Testing
Uses a Docker container with ARM TTK module to validate templates. The Dockerfile contents can be found in the root directory.

### GitHub Actions
Uses the official Microsoft ARM TTK action with reviewdog for enhanced PR feedback. The workflow configuration can be found in `.github/workflows/arm-ttk.yml`.

## Example Templates
The project includes sample templates demonstrating best practices:

- Storage account template: `src/azuredeploy.json`
- Parameters file: `src/azuredeploy.parameters.json`

## Conclusion

This POC demonstrates a pipeline for automated testing of ARM templates using a Docker container and an Azure Pipeline. The modular design allows for easy extension and integration into existing CI/CD workflows.