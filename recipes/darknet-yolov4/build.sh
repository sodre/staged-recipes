#!/usr/bin/env bash
set -euf

MODELS_PREFIX=$PREFIX/models/${PKG_NAME/-//}
ENV_VARS_D=$PREFIX/etc/conda/env_vars.d
PKG_NAME_UPPER=${PKG_NAME^^}
MODEL_NAME=${PKG_NAME/darknet-/}

mkdir -p $MODELS_PREFIX
mkdir -p $ENV_VARS_D

for ext in weights config labels; do
  cp ${MODEL_NAME}.${ext} $MODELS_PREFIX
done

cat >$ENV_VARS_D/$PKG_NAME.json <<EOF
{
  "${PKG_NAME_UPPER/-/_}_WEIGHTS": "$MODELS_PREFIX/${MODEL_NAME}.weights",
  "${PKG_NAME_UPPER/-/_}_CONFIG": "$MODELS_PREFIX/${MODEL_NAME}.config",
  "${PKG_NAME_UPPER/-/_}_LABELS": "$MODELS_PREFIX/${MODEL_NAME}.labels",
  "${PKG_NAME_UPPER/-/_}_VERSION": "${PKG_VERSION}"
}
EOF
