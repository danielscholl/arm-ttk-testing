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