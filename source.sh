# Cadence
export EDA=/eda
export CDS_LOG_PATH=$EDA/log
export CDS_LIC_FILE=$EDA/license/license.dat
export CDS_AUTO_64BIT=ALL
# Virtuoso
export IC618=$EDA/IC618
export PATH=$PATH:$IC618/tools/dfII/bin:$IC618/tools/bin:$IC618/bin
export W3264_NO_HOST_CHECK=1
# Spectre
export SPECTRE=$EDA/SPECTRE181
export PATH=$PATH:$SPECTRE/tools/dfII/bin:$SPECTRE/tools/bin:$SPECTRE/bin

# Help
export QTWEBENGINE_DISABLE_SANDBOX=1
export CDNSHELP_DOC=$IC618/doc:$SPECTRE/doc
export CDNSHELP_OFFLINE=t

# Fix libGL error: No matching fbConfigs
export LIBGL_ALWAYS_INDIRECT=1

# Virtuoso Shortcut
v() {
  cd $EDA
  nohup virtuoso > /tmp/virtuoso.log &
  cd -
}

