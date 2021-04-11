# Mounting ~/.pulumi somewhere and then logging in to that file with `pulumi login file://<path-to-.pulumi>`
# will persist the stack state. We can't mount it to ~/.pulumi in the container because that's where the executable is.
docker run -it --rm --name s3-test-pulumi -v $HOME/.aws:/home/pulumi/.aws -v $HOME/.pulumi:/home/pulumi/stacks/.pulumi -v $PWD/pulumi:/home/pulumi/workspace pulumi:auto