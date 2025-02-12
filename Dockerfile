FROM centos

MAINTAINER dory_sense

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47.tar.gz
RUN tar xvfz apache*.tar.gz \
&& mv apache-tomcat-8.5.47/* /opt/tomcat/.
RUN yum -y install java
#RUN java -version

#WORKDIR /opt/tomcat/webapps
#RUN curl -O -L http://192.168.1.73:8081/repository/maven-snapshots/sparkjava-hello-world-1.0-20191125.100147-1.war
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

#WORKDIR /opt/tomcat/bin
EXPOSE 8082

#CMD ["catalina.sh", "run"]



