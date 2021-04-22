# https://docs.fluxcd.io/en/latest/tutorials/get-started/

# Install fluxctl
choco install fluxctl

# Set AKS as your default context
az aks get-credentials -g az-400 -n name_of_aks_cluster

# Create flux namespace
kubectl create namespace flux

# Install flux
fluxctl install --git-user=AdminTurnedDevOps --git-email=AdminTurnedDevOps@users.noreply.github.com --git-url=git@github.com:AdminTurnedDevOps/containerized-python.git --git-path=workloads --namespace=flux | kubectl apply -f -

From the above command, you can see that there is a `--git-path` with one path, workloads. `Flux` expects to see the Kubernetes manifest files in this directory. Ensure to put your manifests in the `workloads` directory, or if you want to use a different directory in GitHub, change the git path.

# Check deployment status
kubectl -n flux rollout status deployment/flux

# Give write access
fluxctl identity --k8s-fwd-ns flux

`In order to sync your cluster state with git you need to copy the public key and create a deploy key with write access on your GitHub repository.`
1. Open up the repository
2. Go to settings
3. Under settings, go to Deploy keys
4. Add in the public SSH key that was printed out on the terminal from the previous step
5. Paste in the key in GitHub under Deploy keys and click on `Allow write access`

# Flux sync
By default, Flux sync every five minutes. If you want to manually sync Flux, run the following:

fluxctl sync --k8s-fwd-ns flux

# List workflows
fluxctl list-workloads --k8s-fwd-ns flux