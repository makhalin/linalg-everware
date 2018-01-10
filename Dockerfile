FROM jupyterhub/singleuser@sha256:faafdae4db2c5a93e693c6bca3799aff00206657f080c15ee2ddfd04562d119a

RUN pip install numpy scipy matplotlib ipywidgets scikit-learn
RUN pip install nbgrader

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter nbextension install --sys-prefix --py nbgrader --overwrite
RUN jupyter nbextension enable --sys-prefix --py nbgrader
RUN jupyter serverextension enable --sys-prefix --py nbgrader

# Disable assignment creating interface for user
RUN jupyter nbextension disable --sys-prefix create_assignment/main
RUN jupyter nbextension disable --sys-prefix formgrader/main --section=tree
RUN jupyter serverextension disable --sys-prefix nbgrader.server_extensions.formgrader

USER root
