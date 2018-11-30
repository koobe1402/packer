# State

Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to configurations, keep track of metadata, and to improve performance for large infrastructures.

This state is stored by default in a local file named "terraform.tfstate", but it can also be stored remotely, which works better in a team environment.

Terraform uses this local state to create plans and make changes to your infrastructure. Prior to any operation, Terraform does a refresh to update the state with the real infrastructure.


# State Storage

Backends determine where state is stored. For example, the local (default) backend stores state in a local JSON file on disk.

We're using S3 as a backend state storage because it's easy to configure and does not require extra infrastructure (eg Consul).


# Format

The state is in JSON format and Terraform will promise backwards compatibility with the state file. The JSON format makes it easy to write tools around the state if you want or to modify it by hand in the case of a Terraform bug. The "version" field on the state contents allows us to transparently move the format forward if we make modifications.
