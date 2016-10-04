USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
#PB_EXTRA_ARGS+= --sign "Your Org"

BRANDING=Preconfigured
TITLE=Pulse-Secure-${BRANDING}
PACKAGE_NAME=${TITLE}
INSTALLER_PATH = "."
INSTALLER = `ls ./*.dmg`
PACKAGE_VERSION=`ls ./*.dmg | sed -n -e 's/.*mac-\(.*\)-installer.*/\1/p'`
CONFIG = `ls ./*.jnprpreconfig`
REVERSE_DOMAIN=net.juniper
MANAGEMENT_DIR = "junos"
CONFIG = `ls ./*.jnprpreconfig`
PAYLOAD=\
	pack-server \
	pack-script-postinstall
 
pack-server:
	@sudo mkdir -p ${WORK_D}/Library/Management/$(MANAGEMENT_DIR)
	@sudo cp $(INSTALLER_PATH)/$(INSTALLER) ${WORK_D}/Library/Management/$(MANAGEMENT_DIR)/Pulse-Secure.dmg
	@sudo cp $(INSTALLER_PATH)/$(CONFIG) ${WORK_D}/Library/Management/$(MANAGEMENT_DIR)/config.jnprpreconfig
	@sudo chown -R root:wheel ${WORK_D}/Library/Management/$(MANAGEMENT_DIR)