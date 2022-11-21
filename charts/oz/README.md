# oz

![Version: 0.0.10](https://img.shields.io/badge/Version-0.0.10-informational?style=flat-square) ![AppVersion: sha-5ce6861](https://img.shields.io/badge/AppVersion-sha--5ce6861-informational?style=flat-square)

Installation for the Oz RBAC Controller

**Homepage:** <https://github.com/diranged/oz>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| diranged |  | <https://github.com/diranged> |

## Source Code

* <https://github.com/diranged/oz>

## Requirements

Kubernetes: `>=1.22.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controllerManager.kubeRbacProxy.image.repository | string | `"gcr.io/kubebuilder/kube-rbac-proxy"` |  |
| controllerManager.kubeRbacProxy.image.tag | string | `"v0.13.0"` |  |
| controllerManager.kubeRbacProxy.resources.limits.cpu | string | `"500m"` |  |
| controllerManager.kubeRbacProxy.resources.limits.memory | string | `"128Mi"` |  |
| controllerManager.kubeRbacProxy.resources.requests.cpu | string | `"5m"` |  |
| controllerManager.kubeRbacProxy.resources.requests.memory | string | `"64Mi"` |  |
| controllerManager.manager.image.repository | `string` | `"ghcr.io/diranged/oz"` | Docker Image repository and name to use for the controller. |
| controllerManager.manager.image.tag | `string` | `nil` | If set, overrides the .Chart.AppVersion field to set the target image version for the Oz controller. |
| controllerManager.manager.resources.limits.cpu | string | `"500m"` |  |
| controllerManager.manager.resources.limits.memory | string | `"128Mi"` |  |
| controllerManager.manager.resources.requests.cpu | string | `"10m"` |  |
| controllerManager.manager.resources.requests.memory | string | `"64Mi"` |  |
| controllerManager.nodeSelector | `map` | `nil` | A nodeSepector to apply to the controller-manager pods. See https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/. |
| controllerManager.replicas | `int` | `1` | Number of Oz Controllers to run. If more than one is used, leader-election is used to ensure only one controller is operating at a time. |
| controllerManager.tolerations | `[]map]` | `[]` | A list of Tolerations that will be applied to the controller-manager pods. See https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/. |
| kubernetesClusterDomain | `string` | `"cluster.local"` | Configures the KUBERNETES_CLUSTER_DOMAIN environment variable. |
| metricsService.ports[0].name | string | `"https"` |  |
| metricsService.ports[0].port | int | `8443` |  |
| metricsService.ports[0].protocol | string | `"TCP"` |  |
| metricsService.ports[0].targetPort | string | `"https"` |  |
| metricsService.type | string | `"ClusterIP"` |  |
| rbac.create | `bool` | `true` | If true, the chart will create aggregated roles for accessing the access templates and access request resources. |
| rbac.requestAccess.aggregateTo | `map` | `{"rbac.authorization.k8s.io/aggregate-to-admin":"true","rbac.authorization.k8s.io/aggregate-to-edit":"true"}` | These labels are applied to the "request-access" ClusterRole and are intended to grant developers the permission to make an Access Request. These can be fairly widely granted because the true permissions for who has access to use an Access Request are defined in the Access Template resouces themselves. |
| rbac.templateManager.aggregateTo | `map` | `{"rbac.authorization.k8s.io/aggregate-to-admin":"true","rbac.authorization.k8s.io/aggregate-to-edit":"true"}` | These labels are applied to the "template-manager" ClusterRole and are used to define how to aggregate up the privileges for managing Access Templates. |
| rbac.viewAccess.aggregateTo | `map` | `{"rbac.authorization.k8s.io/aggregate-to-admin":"true","rbac.authorization.k8s.io/aggregate-to-edit":"true","rbac.authorization.k8s.io/aggregate-to-view":"true"}` | These labels are applied to the "view-access" ClusterRole and are used to define how to aggregate up the privileges to your RBAC system. The default settings here are reasonably sane. |
