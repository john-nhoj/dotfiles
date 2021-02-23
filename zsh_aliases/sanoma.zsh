alias mfa='~/.aws/populate_mfa.sh sndp_mfa sndp'
alias aws-sanoma-sndp='export AWS_PROFILE=aws-sanoma-sndp'
alias nonprod='export AWS_PROFILE=sndp-nonprod'
alias prod='export AWS_PROFILE=sndp-prod'
alias sndp-who='echo $AWS_PROFILE'

# Aliases for SCv4
alias scv4='./sbt -Dconfig.resource=local.conf -Dapi.auth.disabled=true'
