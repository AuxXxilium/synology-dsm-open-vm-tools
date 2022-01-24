
# Package specific behaviors
# Sourced script by generic installer and start-stop-status scripts
VMTOOLS_DIR=${SYNOPKG_PKGDEST}
VMTOOLS_DAEMON="${VMTOOLS_DIR}/bin/vmtoolsd"
CONF_FILE=${VMTOOLS_DIR}/etc/vmware-tools/tools.conf

PATH="${VMTOOLS_DIR}/bin:${PATH}"

SERVICE_COMMAND="${VMTOOLS_DAEMON} -b ${PID_FILE} -c ${CONF_FILE}"

service_postinst ()
{

    cat > ${CONF_FILE} << EOF
bindir = "${SYNOPKG_PKGDEST}/bin"	
libdir = "${SYNOPKG_PKGDEST}/lib"
EOF
}

service_postuninst ()
{
    # Remove link
    rm -f ${VMTOOLS_DIR}

}