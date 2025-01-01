alias kx="kubectx"

alias p="python3"

alias dep="k get deployment -n"

alias pod="k get pod -n"

alias ns="k get ns"

alias pvc="k get vpc -n"

alias pv="k get pv -n"

alias svc="k get svc -n"

alias ing="k get ingress -n"

alias ds="k get daemonset -n"

alias sts="k get sts -n"

alias h="helm"

alias hl="helm list"

alias log="k logs -n"

alias nodes="k get nodes"

alias ex='function _ex() { pod=$2; ns=$1; kubectl exec -it $pod -n $ns -- sh; }; _ex'

alias pp='function _pp() { ns=$1; svc=$2; bind=$3; kubectl -n $ns port-forward svc/$svc $bind }; _pp'
