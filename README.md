# Aider Installer (aider-installer)

Installs aider-chat, an AI pair programmer that lets you code with any LLM in your terminal.

## Example Usage

You can use this feature in your `devcontainer.json` file:

```json
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/devcontainers/features/python:1": {
            "version": "3.11"
        },
        "ghcr.io/lucasliet/aider-codespace/aider-installer:latest": {}
    }
}
```

After the container is built, you will need to configure `aider-chat` with your OpenAI API key. You can do this by setting the `OPENAI_API_KEY` environment variable or add it to your codespace secrets. for more information about OpenAI or other LLMs configuration, please refer to the [aider-chat documentation](https://aider.chat/docs/llms.html).

To verify the installation, open a new terminal and run:
```bash
aider --version
```

## Requirements

This feature requires Python and pip to be installed and available on the PATH. It is recommended to use the `ghcr.io/devcontainers/features/python` feature to install Python before this one.

For more information on `aider-chat`, visit the official repository: [https://github.com/paul-gauthier/aider](https://github.com/paul-gauthier/aider)
