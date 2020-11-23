FROM ubuntu:18.04
RUN apt update
RUN apt install maven default-jdk tomcat10 git -y
EXPOSE 80
RUN cd /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN boxfuse run target/hello-1.0.war
CMD ["/bin/bash"]