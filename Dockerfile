FROM ubuntu:18.04 as build
RUN apt update
RUN apt install maven default-jdk git wget -y
EXPOSE 80
RUN mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.40/bin/apache-tomcat-9.0.40.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
#RUN mkdir /usr/local/tomcat
RUN cp -Rv /tmp/apache-tomcat-9.0.40/* /usr/local/tomcat/
RUN cd /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd boxfuse-sample-java-war-hello
RUN mvn -f boxfuse-sample-java-war-hello/pom.xml clean package
RUN cp boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
