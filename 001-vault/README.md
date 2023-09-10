Vault  Ref: youtube- pablo's spot how to integrate valut with terraform

## Install valut locally.  
HashiCorp Vault can be run locally for development and testing purposes using a single-server configuration. Here are the steps to run HashiCorp Vault locally:

1. **Download and Install Vault:**

   You can download the appropriate version of Vault for your operating system from the official HashiCorp website: https://www.vaultproject.io/downloads

   Follow the installation instructions for your specific OS.

2. **Start Vault in Dev Mode:**

   HashiCorp Vault provides a convenient "dev" mode for local development and testing. This mode runs Vault in-memory with a root token for easy exploration.

   To start Vault in dev mode, open a terminal and run the following command:

   ```bash
   vault server -dev
   ```

   Vault will start and display some information, including the unseal key and the root token. Make sure to save the root token; you'll need it to interact with the dev server.

3. **Set Environment Variables:**

   For the Vault CLI to connect to the local dev server, you need to set the `VAULT_ADDR` environment variable to the address of the dev server:

   ```bash
   export VAULT_ADDR='http://127.0.0.1:8200'
   ```

   You can add this command to your shell profile (e.g., `.bashrc`, `.zshrc`) to make it persistent.

4. **Initialize Vault:**

   In dev mode, Vault doesn't require manual initialization, as it is pre-configured. However, if you want to initialize it manually, you can use the following command:

   ```bash
   vault operator init
   ```

   This command will provide you with the unseal keys and root token. In dev mode, you can also find these details in the terminal where you started Vault.

5. **Unseal Vault (if necessary):**

   In a production setup, Vault is typically sealed for security. However, in dev mode, it's unsealed automatically. If you manually sealed Vault (using the `vault operator seal` command), you can unseal it using the unseal keys. In dev mode, this step is usually not needed.

6. **Authenticate and Interact with Vault:**

   You can authenticate to Vault using the root token obtained in step 2:

   ```bash
   vault login
   ```

   After authentication, you can start interacting with Vault by creating secrets, policies, and more. For example, you can create a secret:

   ```bash
   vault kv put secret/myapp/apikey=mysecretapikey
   ```

   This command stores a key-value pair in the "secret/myapp" path.

7. **Shutdown Vault:**

   To stop the local Vault dev server, simply close the terminal or use `Ctrl+C`.

That's it! You've successfully set up and run HashiCorp Vault locally in dev mode. Remember that dev mode is not suitable for production environments but is convenient for development and testing purposes. For production deployments, you should follow a proper Vault deployment and configuration process.


## Run terraform plan  
``````
terraform plan -var-file input.tfvars -out output.tfplan
``````