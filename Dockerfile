FROM ubuntu:18.04
RUN apt update
RUN apt install maven default-jdk tomcat9 git -y
EXPOSE 80
RUN cd /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd boxfuse-sample-java-war-hello
RUN mvn -f boxfuse-sample-java-war-hello/pom.xml clean package
RUN cp boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
#CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]
#ENTRYPOINT ["java", "-jar", "/var/lib/tomcat9/webapps/hello-1.0.war"]
#CMD ["/bin/bash"]