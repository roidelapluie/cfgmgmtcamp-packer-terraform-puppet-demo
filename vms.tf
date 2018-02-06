data "digitalocean_image" "httpserver" {
  name = "${var.do_image}"
}

resource "digitalocean_droplet" "cfgmgmtcamp" {
  count    = "${var.do_count}"
  name     = "${format("cfgmgmtcamp%02d", count.index + 1)}"
  image    = "${data.digitalocean_image.httpserver.image}"
  ssh_keys = ["${var.do_ssh_key}"]
  region   = "${var.do_datacenter}"
  size     = "512mb"
}
