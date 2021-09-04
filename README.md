# Keres

Keres is a simple and quick all-in-one dockerized solution for harvesting websites. Keres is comprised of:

- [Web Curator Tool 3.x.x](https://github.com/WebCuratorTool/webcurator)
- MySQL image
- [Heritrix 3.4.0](https://github.com/internetarchive/heritrix3)
- [pywb](https://github.com/webrecorder/pywb)

Keres provides some default configurations so you can jump into harvesting immediately without having to worry about users, permissions, templates, profiles, bandwiths, etc. Simply log in to Web Curator Tool and start harvesting.

If you want to use the default configuration and DB which ships with WCT, set the DB_DEFAULT to `default` in the `.env` file.

## Setup

1. Clone this repo and enter the directory
2. Copy the `sample.env` file to `.env`
3. Check out the `.env` file and change parameters as you wish
4. If you don't already have it, [install the latest version of docker](https://docs.docker.com/engine/install/)
5. If you don't already have it, [install the latest version of docker-compose](https://docs.docker.com/compose/install/)
6. Follow the [Docker post-install steps](https://docs.docker.com/engine/install/linux-postinstall/) if you're not using the root user with Docker
7. Run `docker-compose up -d`
8. Wait a bit for all services to start up

Services are available at:

| Service      | Address |
| ----------- | ----------- |
| WCT      | http://localhost:8080/wct       |
| Heritrix   | https://localhost:8443/engine        |
| pywb   | http://localhost:9080        |

## Harvesting

### Log in to WCT

Login credentials for out-of-the-box WCT user are:

Username: `bootstrap`  
Password: `XCgsDrQCHgAck0Wg`

You can change the default password in the WCT UI after login if you wish or you can add new users and disable the bootstrap user.

### Configure harvest settings

Keres ships with a custom fine-tuned profile. Alternatevily, you can create a new profile which will then use the default Heritrix 3 settings.

**NOTE**: It is advised to change the `metadata.operatorContactUrl` field in the Heritrix profile after installation to reflect your real contact URL.

### Run a harvest

To start harvesting, you can jump into Targets immediately. See [this documentation](https://webcuratortool.readthedocs.io/en/latest/guides/user-manual.html#how-to-create-a-target) on how to start a harvest.
After a target instance is harvested, you can [review it](https://webcuratortool.readthedocs.io/en/latest/guides/user-manual.html#opening-quality-review-tools) with "Review this harvest", an internal WCT playback tool.
If you are satisfied with the harvest, [endorse it and submit it to archive](https://webcuratortool.readthedocs.io/en/latest/guides/user-manual.html#endorse-or-reject-harvest-results), after which it will be available in pywb.

Pywb looks for harvests to index every 30 seconds. If you've made a large harvest in WCT, it might take a while for it to be indexed in pywb, but generally it's very quick.
