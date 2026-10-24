FROM debian:stable

RUN apt update -y
RUN apt install -y fontconfig openjdk-21-jre wget

RUN mkdir -p /etc/apt/keyrings

RUN wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

RUN echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
> /etc/apt/sources.list.d/jenkins.list

RUN apt update -y
RUN apt install -y jenkins

EXPOSE 8080

CMD ["java", "-jar", "/usr/share/java/jenkins.war", "--httpPort=8080"]
