# Install fluxctl
choco install fluxctl

# Install flux
fluxctl install --git-user=AdminTurnedDevOps --git-email=AdminTurnedDevOps@users.noreply.github.com --git-url=git@github.com:AdminTurnedDevOps/containerized-python.git --git-path=namespaces,workloads --namespace=flux | kubectl apply -f -

# Set identity
fluxctl identity --k8s-fwd-ns flux

# List workflows
fluxctl list-workloads --k8s-fwd-ns flux