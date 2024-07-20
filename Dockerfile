FROM amazoncorretto:8

RUN set -ex ;\
  yum update -y ;\
  yum install -y \
    tree \
    wget \
    unzip \
    ;\
  yum clean all

ENV GRADLE_VERSION=7.6
ENV GRADLE_HOME=/opt/gradle
RUN set -ex ;\
  mkdir ${GRADLE_HOME} ;\
  cd ${GRADLE_HOME} ;\
  wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip ;\
  unzip -d /opt/gradle gradle-${GRADLE_VERSION}-bin.zip ;\
  ln -s ${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle
