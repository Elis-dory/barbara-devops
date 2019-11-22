FROM centos

MAINTAINER barbara.ammannati@sourcesense.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47-deployer.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.47-deployer/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
COPY /var/lib/jenkins/workspace/Deploy_war_1/target/sparkjava-hello-world-1.0-SNAPSHOT.war /opt/tomcat/webapps/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
