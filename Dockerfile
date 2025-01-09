FROM openjdk

WORKDIR /app

COPY . /app

RUN index.jsp

CMD ["java","index"]