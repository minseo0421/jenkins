FROM jenkins/jenkins:lts
USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN apt upgrade -y
RUN apt-get update -y
RUN curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh


----------------------------------------------------------------------
#옵션 설명
#불러올 이미지 선택
FROM jenkins/jenkins:lts

#사용자 변경
USER root

#TimeZone을 KST로 변경
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

#Ubuntu 업데이트
RUN apt upgrade -y
RUN apt-get update -y

#Docker 설치
RUN curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh


#Jenkins Docker 시작
docker run -itd --name jenkins -p 8080:8080 -p 50000:50000 -v /docker/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -e TZ=Asia/Seoul -u root teichae/jenkins:0.1
