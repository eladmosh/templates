#!/usr/bin/python

from azure.identity import ClientSecretCredential
from azure.keyvault.secrets import SecretClient
from azure.mgmt.resource import ResourceManagementClient
from base64 import b64encode
import json
import os
import requests
import sys


def main(argv):

    with open("config.json") as json_file:
        data = json.load(json_file)

    tenant_id = os.environ["ARM_TENANT_ID"]
    client_id = os.environ["ARM_CLIENT_ID"]
    client_secret = os.environ["ARM_CLIENT_SECRET"]

    # Acquire a credential object using CLI-based authentication.
    credential = ClientSecretCredential(
        tenant_id=tenant_id, client_id=client_id, client_secret=client_secret)

    # Get env0 Environment ID
    env0_environment_id = os.environ["ENV0_ENVIRONMENT_ID"]

    # region Azure Tenant

    # Retrieve subscription ID from environment variable.
    subscription_id = os.environ["ARM_SUBSCRIPTION_ID"]

    # Obtain the management object for resources.
    resource_client = ResourceManagementClient(credential, subscription_id)

    # env0_environment_id = "dc3796c3-31a3-4575-933a-5d9629cbc09d"
    varonis_customer_id = env0_environment_id[0:5]
    varonis_environment = "dev"
    resource_group_name = f"azeu2-{varonis_environment}-tnnt{varonis_customer_id}-rg"
    azure_resource_group = {}

    Environment = {
        "AzureExists": False,
        "AzureTenant": {},
        "Env0Environment": {},
        "Env0Deployments": [],
    }

    # Checks whether resource group exists
    azure_resource_group_exists = resource_client.resource_groups.check_existence(
        resource_group_name)

    Environment["AzureExists"] = azure_resource_group_exists

    if azure_resource_group_exists:
        azure_resource_group = resource_client.resource_groups.get(
            resource_group_name).as_dict()
        Environment["AzureTenant"] = azure_resource_group
    # endregion

    # region env0 Environment
    env0UserSecretName = "Env0User"
    env0PassSecretName = "Env0Password"
    env0KeyVaultName = data["Env0_Azure_KV"]
    env0KeyVaultUri = f"https://{env0KeyVaultName}.vault.azure.net"

    env0SecretClient = SecretClient(
        vault_url=env0KeyVaultUri, credential=credential, connection_verify=False)

    env0User = env0SecretClient.get_secret(env0UserSecretName)
    env0Password = env0SecretClient.get_secret(env0PassSecretName)

    env0UserAndPassStr = "{}:{}".format(env0User.value, env0Password.value)
    env0UserAndPass = b64encode(env0UserAndPassStr.encode()).decode("ascii")

    env0AuthHeaderValue = "Basic " + env0UserAndPass

    env0ApiUrlEnvironments = f"https://api.env0.com/environments/{env0_environment_id}"
    env0ApiUrlDeployments = f"{env0ApiUrlEnvironments}/deployments"

    env0AuthHeader = {"Authorization": env0AuthHeaderValue}

    env0EnvironmentResponse = requests.get(
        env0ApiUrlEnvironments, headers=env0AuthHeader, verify=False)
    env0Environment = json.loads(env0EnvironmentResponse.text)

    Environment["Env0Environment"] = env0Environment

    env0DeploymentsResponse = requests.get(
        env0ApiUrlDeployments, headers=env0AuthHeader, verify=False)
    env0Deployments = json.loads(env0DeploymentsResponse.text)

    Environment["Env0Deployments"] = env0Deployments

    print(json.dumps(Environment, indent=2, sort_keys=False))


if __name__ == "__main__":
    main(sys.argv[1:])
