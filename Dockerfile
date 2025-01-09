FROM openjdk

WORKDIR /app

COPY . /app

RUN javac index.jsp

CMD ["java","index"]