{
    variables: {
        do_api_token: "{{env `DIGITALOCEAN_TOKEN`}}",
    },
    builders: [
        {
            type: "digitalocean",
            api_token: "{{user `do_api_token`}}",
            image: "centos-7-x64",
            ssh_username: "root",
            region: "ams3",
            size: "512mb",
            snapshot_name: "httpserver-{{timestamp}}",
        },
    ],
    provisioners: [
        {
            type: "shell",
            script: "install_puppet_agent.sh",
        },
        {
            puppet_bin_dir: "/opt/puppetlabs/bin",
            prevent_sudo: true,
            type: "puppet-masterless",
            manifest_file: "httpd.pp",
        },
    ],
}
